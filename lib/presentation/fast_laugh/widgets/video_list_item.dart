import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/search/widgets/search_idle.dart';

class VideoListItem extends StatelessWidget {
  final index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
          child: Align(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            imageUrl,
                          ),
                        ),
                        Kheight30,
                        VideoActionsWidget(
                            label: "LOL", icon: Icons.emoji_emotions),
                        Kheight30,
                        VideoActionsWidget(label: "My List", icon: Icons.add),
                        Kheight30,
                        VideoActionsWidget(label: "Share", icon: Icons.share),
                        Kheight30,
                        VideoActionsWidget(
                            label: "Play", icon: Icons.play_arrow_rounded),
                        Kheight,
                      ],
                    ),
                  )
                ],
              ),
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
  const VideoActionsWidget({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: color_white,
        ),
        Text(label),
      ],
    );
  }
}
