import 'package:intl/intl.dart';
import 'package:live_weather/features/weather/domain/entity/current_weather_entity.dart';

class TimeFormatter {
  static var formatter = DateFormat.jm();
  static getSunriseTime(CurrentWeatherEntity currentWeatherEntity) {
    DateTime utcDate = DateTime.fromMillisecondsSinceEpoch(currentWeatherEntity.sys!.sunrise! * 1000, isUtc: true);

    DateTime localDate = utcDate.add(Duration(seconds: currentWeatherEntity.timezone!));

    String sunrise = DateFormat('hh:mm a').format(localDate);
    return sunrise;
  }

  static getSunsetTime(CurrentWeatherEntity currentWeatherEntity) {
    DateTime utcDate = DateTime.fromMillisecondsSinceEpoch(currentWeatherEntity.sys!.sunset! * 1000, isUtc: true);

    DateTime localDate = utcDate.add(Duration(seconds: currentWeatherEntity.timezone!));

    String sunset = DateFormat('hh:mm a').format(localDate);
    return sunset;
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
