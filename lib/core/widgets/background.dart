import 'package:flutter/material.dart';

class DayNightImage {
  static AssetImage getBackGroundImage({int sunriseHour=6,int sunriseMinute=0,int sunsetHour=6,int sunsetMinute=0}) {
    TimeOfDay now = TimeOfDay.now();

    TimeOfDay sunrise = TimeOfDay(hour: sunriseHour, minute: sunriseMinute);
    TimeOfDay sunset =  TimeOfDay(hour: sunsetHour+12, minute: sunsetMinute);

    bool isDayTime = now.hour >= sunrise.hour && now.hour < sunset.hour;

    String imagePath =
        isDayTime ? 'assets/images/day.png' : 'assets/images/night.png';

    return AssetImage(imagePath);
  }
}
