part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<NewandHotData> topnetflixmovieslist,
    required List<NewandHotData> trendingnowlist,
    required List<NewandHotData> tvshowsbasedonbookslist,
    required List<NewandHotData> newreleaseslist,
    required List<NewandHotData> tvdramaslist,
    required List<NewandHotData> top10list,
    required List<NewandHotData> usmovielist,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HomeState.initial() => const HomeState(
      stateId: '0',
      topnetflixmovieslist: [],
      trendingnowlist: [],
      tvshowsbasedonbookslist: [],
      newreleaseslist: [],
      tvdramaslist: [],
      usmovielist: [],
      top10list: [],
      isLoading: true,
      hasError: false);
}
