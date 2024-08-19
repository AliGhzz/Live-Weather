// import 'package:flutter/material.dart';
// import 'package:live_weather/features/weather/domain/entity/current_weather_entity.dart';

// abstract class CwStatus {}

// class CwLoading extends CwStatus {}

// class CwCompleted extends CwStatus {
//   final CurrentWeatherEntity currentWeatherEntity;
//   CwCompleted(this.currentWeatherEntity);
// }

// class CwError extends CwStatus {
//   final String message;
//   CwError(this.message);
// }

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:live_weather/features/weather/domain/entity/current_weather_entity.dart';

@immutable
abstract class CwStatus extends Equatable{}

class CwLoading extends CwStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CwCompleted extends CwStatus{
  final CurrentWeatherEntity currentWeatherEntity;
  CwCompleted(this.currentWeatherEntity);

  @override
  // TODO: implement props
  List<Object?> get props => [currentWeatherEntity];
}

class CwError extends CwStatus{
  final String message;
  CwError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}