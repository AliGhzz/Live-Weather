part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadCwEvent extends HomeEvent {
  final String city;
  LoadCwEvent(this.city);
}

class UpdateFailedNumber extends HomeEvent{
  int value;
  UpdateFailedNumber(this.value);
}