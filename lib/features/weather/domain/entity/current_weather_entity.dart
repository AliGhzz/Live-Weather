import 'package:equatable/equatable.dart';
import 'package:live_weather/features/weather/data/model/curreny_weather_model.dart';

class CurrentWeatherEntity extends Equatable {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Rain? rain;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  const CurrentWeatherEntity(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.rain,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  //compare objects of this class baesd on items that list in the bottom props:
  @override
  List<Object?> get props => [coord, weather, main];
}
