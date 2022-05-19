import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/downloads/i_downloads_repo.dart';
import 'package:netflixclone/domain/search/searchservice.dart';

import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/models/search_response/search_response.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(
    this._searchService,
    this._downloadsService,
  ) : super(SearchState.initial()) {
    /*
    idle
    */

    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
          searchResultList: [],
          idleList: state.idleList,
          isLoading: false,
          isError: false,
        ));
        return;
      }
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      //get trwnding
      final _result = await _downloadsService.getDownloadsImage();
      final _state = _result.fold(
          (MainFailure f) => const SearchState(
                searchResultList: [],
                idleList: [],
                isLoading: false,
                isError: true,
              ),
          (List<Downloads> list) => SearchState(
                searchResultList: [],
                idleList: list,
                isLoading: false,
                isError: false,
              ));
      emit(_state);

      //show to ui
    });
    /*
    searchresultstate
    */

    on<SearchMovie>((event, emit) async {
      //callsearch movie api
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
          (MainFailure f) => const SearchState(
                searchResultList: [],
                idleList: [],
                isLoading: false,
                isError: true,
              ),
          (SearchResponse r) => SearchState(
                searchResultList: r.results!,
                idleList: [],
                isLoading: false,
                isError: false,
              ));
      emit(_state);

      //show to ui
    });
  }
}
