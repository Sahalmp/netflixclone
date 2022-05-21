import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/application/fastlaugh/fastlaugh_bloc.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/search/widgets/search_idle.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../../../domain/downloads/models/downloads.dart';

const _imageUrl =
    "https://www.themoviedb.org/t/p/original/u9fvqenMMyeyWjIWFRxjnfJvD1N.jpg";

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.movieData,
  }) : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyvideoUrls[index % dummyvideoUrls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(
            videourl: videoUrl, onStateChanged: (bool) {}, index: index),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),

            //Left Section
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.volume_mute_outlined,
                  size: 30,
                  color: color_white,
                ),
                //Right side

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage(
                                '$imageAppendUrl$posterPath',
                              ),
                      ),
                      Kheight30,
                      ValueListenableBuilder(
                        builder: (BuildContext c, Set<int> newLikedListIds,
                            Widget? _) {
                          final _index = index;
                          if (newLikedListIds.contains(_index)) {
                            return GestureDetector(
                              onTap: () {
                                // BlocProvider.of<FastlaughBloc>(context)
                                //     .add(UnlikeVideo(id: index));
                                likedVideosValueNotifier.value.remove(_index);
                                likedVideosValueNotifier.notifyListeners();
                              },
                              child: const VideoActionsWidget(
                                label: "LOL",
                                icon: Icons.emoji_emotions,
                                color: Colors.red,
                              ),
                            );
                          }
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastlaughBloc>(context)
                              //     .add(LikeVideo(id: index));
                              likedVideosValueNotifier.value.add(_index);
                              likedVideosValueNotifier.notifyListeners();
                            },
                            child: const VideoActionsWidget(
                              label: "LOL",
                              icon: Icons.emoji_emotions_outlined,
                            ),
                          );
                        },
                        valueListenable: likedVideosValueNotifier,
                      ),
                      Kheight30,
                      const VideoActionsWidget(
                          label: "My List", icon: Icons.add),
                      Kheight30,
                      GestureDetector(
                        onTap: () {
                          final movieName =
                              VideoListItemInheritedWidget.of(context)
                                  ?.movieData
                                  .title;
                          if (movieName != null) {
                            Share.share(movieName);
                          }
                        },
                        child: const VideoActionsWidget(
                            label: "Share", icon: Icons.share),
                      ),
                      Kheight30,
                      GestureDetector(
                        child: const VideoActionsWidget(
                            label: "Play", icon: Icons.play_arrow_rounded),
                      ),
                      Kheight,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const VideoActionsWidget(
      {Key? key,
      required this.icon,
      required this.label,
      this.color = color_white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: color,
        ),
        Text(label),
      ],
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videourl;
  final void Function(bool isPlaying) onStateChanged;
  final int index;
  const FastLaughVideoPlayer(
      {Key? key,
      required this.videourl,
      required this.onStateChanged,
      required this.index})
      : super(key: key);

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  bool playStatus = true;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videourl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        if (likedVideosValueNotifier.value.contains(widget.index)) {
          likedVideosValueNotifier.value.remove(widget.index);
          likedVideosValueNotifier.notifyListeners();
        } else {
          likedVideosValueNotifier.value.add(widget.index);
          likedVideosValueNotifier.notifyListeners();
        }
      },
      onLongPressStart: (LongPressStartDetails) {
        _videoPlayerController.pause();
      },
      onLongPressEnd: (LongPressEndDetails) {
        _videoPlayerController.play();
      },
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
          )),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
