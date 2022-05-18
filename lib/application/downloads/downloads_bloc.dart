import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:netflixclone/domain/downloads/i_downloads_repo.dart';

import '../../domain/core/failures/main_failures.dart';
import '../../domain/downloads/models/downloads.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        downloadsFailureOrSuccessOption: none(),
      ));
      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadsRepo.getDownloadsImage();
      emit(downloadsOption.fold(
          (failure) => state.copyWith(
                isLoading: false,
                downloadsFailureOrSuccessOption: Some(
                  Left(failure),
                ),
              ),
          (success) => state.copyWith(
                isLoading: false,
                downloadsFailureOrSuccessOption: Some(
                  right(success),
                ),
                downloads: success,
              )));
    });
  }
}
