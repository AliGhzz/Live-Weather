part of 'forcast_bloc.dart';

class ForcastState  {
  FState fState;
  ForcastState({required this.fState});
}

abstract class FState{}

class ForcastLoading extends FState{}

class ForcastLoaded extends FState{
  Forcast forcast;
  ForcastLoaded({required this.forcast});
}

class ForcastError extends FState{}