import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/domain/NewandHot/hotandnew_service.dart';
import 'package:netflixclone/domain/NewandHot/models/discover_movies.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HotAndNewService homeservice;
  HomeBloc(this.homeservice) : super(HomeState.initial()) {
    on<Gethomescreendata>((event, emit) async {
      emit(state.copyWith(isLoading: true, hasError: false));
     
      final _movieresult =
          await homeservice.getHotAndNewMovieData();
      final _tvresult = await homeservice.getHotAndNewTVData();
      final _state1 = _movieresult.fold(
        (f) => HomeState(
          topnetflixmovieslist: [],
          trendingnowlist: [],
          tvshowsbasedonbookslist: [],
          top10list: [],
          isLoading: false,
          hasError: true,
          newreleaseslist: [],
          tvdramaslist: [],
          usmovielist: [],
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        ),
        (r) {
          final topnetflixmovies = r.results;
          final trending = r.results;

          final newreleases = r.results;

          final top10 = r.results;
          final usmovies = r.results;

          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            topnetflixmovieslist: topnetflixmovies!,
            trendingnowlist: trending!,
            tvshowsbasedonbookslist: state.tvshowsbasedonbookslist,
            top10list: top10!,
            isLoading: false,
            hasError: false,
            newreleaseslist: newreleases!,
            tvdramaslist: state.tvdramaslist,
            usmovielist: usmovies!,
          );
        },
      );
      emit(_state1);

      final _state2 = _tvresult.fold(
        (f) => HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          topnetflixmovieslist: [],
          trendingnowlist: [],
          tvshowsbasedonbookslist: [],
          top10list: [],
          isLoading: false,
          hasError: true,
          newreleaseslist: [],
          tvdramaslist: [],
          usmovielist: [],
        ),
        (r) {
          final tvdramas = r.results;
          final tvshowsbasedonbooks = r.results;

          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            topnetflixmovieslist: state.topnetflixmovieslist,
            trendingnowlist: state.trendingnowlist,
            tvshowsbasedonbookslist: tvshowsbasedonbooks!,
            top10list: state.top10list,
            isLoading: false,
            hasError: false,
            newreleaseslist: state.newreleaseslist,
            tvdramaslist: tvdramas!,
            usmovielist: state.usmovielist,
          );
        },
      );
      emit(_state2);
    });
  }
}
