import 'package:intl/intl.dart';
import 'package:live_weather/features/weather/domain/entity/current_weather_entity.dart';

class TimeFormatter {
  static var formatter = DateFormat.jm();
  static getSunriseTime(CurrentWeatherEntity currentWeatherEntity) {
    final sunrise = formatter.format(DateTime.fromMillisecondsSinceEpoch(
      currentWeatherEntity.sys!.sunrise! * 1000,
      //if isUtc:true that shows time in London local time
      isUtc: false,
    ));
    return sunrise;
  }

  static getSunsetTime(CurrentWeatherEntity currentWeatherEntity) {
    final sunrise = formatter.format(DateTime.fromMillisecondsSinceEpoch(
      currentWeatherEntity.sys!.sunset! * 1000,
      //if isUtc:true that shows time in London local time
      isUtc: false,
    ));
    return sunrise;
  }

  static getDayAndMonth(DateTime dateTime){
      DateFormat formatter = DateFormat('MMMM dd');
      return formatter.format(dateTime);

  }
  static getTime(DateTime dateTime) {
    DateFormat formatter = DateFormat('HH:mm'); 
    return formatter.format(dateTime);
}
}
