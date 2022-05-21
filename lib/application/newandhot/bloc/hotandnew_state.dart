part of 'hotandnew_bloc.dart';

@freezed
class HotandnewState with _$HotandnewState {
  const factory HotandnewState({
    required List<NewandHotData> comingsoonList,
    required List<NewandHotData> everyoneiswatchinglist,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory HotandnewState.initial() => const HotandnewState(
      comingsoonList: [],
      everyoneiswatchinglist: [],
      isError: false,
      isLoading: false);
}
