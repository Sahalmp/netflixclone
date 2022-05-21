import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/downloads/i_downloads_repo.dart';
import '../../domain/downloads/models/downloads.dart';
part 'fastlaugh_bloc.freezed.dart';
part 'fastlaugh_event.dart';
part 'fastlaugh_state.dart';

final dummyvideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
];
ValueNotifier<Set<int>> likedVideosValueNotifier = ValueNotifier({});

@injectable
class FastlaughBloc extends Bloc<FastlaughEvent, FastlaughState> {
  FastlaughBloc(
    IDownloadsRepo _downloadService,
  ) : super(FastlaughState.initial()) {
    on<Initialize>((event, emit) async {
      //Sending loading to ui
      emit(
        const FastlaughState(
          videosList: [],
          isLoading: true,
          isError: false,
        ),
      );
      //get trending movies
      final _result = await _downloadService.getDownloadsImage();
      final _state = _result.fold(
        (MainFailure f) => FastlaughState(
          videosList: [],
          isLoading: false,
          isError: true,
        ),
        (List<Downloads> r) => FastlaughState(
          videosList: r,
          isLoading: false,
          isError: false,
        ),
      );

      //send to ui
      emit(_state);
    });

    on<LikeVideo>((event, emit) {
      likedVideosValueNotifier.value.add(event.id);
    });

    on<UnlikeVideo>((event, emit) {
      likedVideosValueNotifier.value.remove(event.id);
    });
  }
}
