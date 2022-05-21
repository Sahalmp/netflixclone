import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/domain/NewandHot/hotandnew_service.dart';
import 'package:netflixclone/domain/NewandHot/models/discover_movies.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';

part 'hotandnew_event.dart';
part 'hotandnew_state.dart';
part 'hotandnew_bloc.freezed.dart';

@injectable
class HotandnewBloc extends Bloc<HotandnewEvent, HotandnewState> {
  final HotAndNewService _hotAndNewService;

  HotandnewBloc(this._hotAndNewService) : super(HotandnewState.initial()) {
    on<LoadDataCommingSoon>((event, emit) async {
      emit(const HotandnewState(
          comingsoonList: [],
          everyoneiswatchinglist: [],
          isLoading: true,
          isError: false));
      final _result = await _hotAndNewService.getHotAndNewMovieData();
      final _state = _result.fold(
        (MainFailure f) => const HotandnewState(
            comingsoonList: [],
            everyoneiswatchinglist: [],
            isLoading: false,
            isError: true),
        (DiscoverMovies r) => HotandnewState(
            comingsoonList: r.results!,
            everyoneiswatchinglist: state.everyoneiswatchinglist,
            isLoading: false,
            isError: false),
      );
      emit(_state);
      print(_state);
      // TODO: implement event handler
    });

    on<LoadDataEveryoneisWatching>((event, emit) async{
      emit(const HotandnewState(
          comingsoonList: [],
          everyoneiswatchinglist: [],
          isLoading: true,
          isError: false));
      final _result = await _hotAndNewService.getHotAndNewTVData();
      final _state = _result.fold(
        (MainFailure f) => const HotandnewState(
            comingsoonList: [],
            everyoneiswatchinglist: [],
            isLoading: false,
            isError: true),
        (DiscoverMovies r) => HotandnewState(
            comingsoonList: state.comingsoonList,
            everyoneiswatchinglist: r.results!,
            isLoading: false,
            isError: false),
      );
      emit(_state);
      print(_state);
    });
  }
}
