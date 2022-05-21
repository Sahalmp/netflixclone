part of 'hotandnew_bloc.dart';

@freezed
class HotandnewEvent with _$HotandnewEvent {
  const factory HotandnewEvent.loadDataCommingSoon() = LoadDataCommingSoon;
  const factory HotandnewEvent.loadDataEveryoneisWatching() =
      LoadDataEveryoneisWatching;
}
