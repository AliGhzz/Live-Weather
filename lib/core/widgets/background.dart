import 'package:flutter/material.dart';

class DayNightImage {
  static AssetImage getBackGroundImage() {
    TimeOfDay now = TimeOfDay.now();
  
    TimeOfDay sunrise = TimeOfDay(hour: 5, minute: 0);
    TimeOfDay sunset =  TimeOfDay(hour: 20, minute: 0);

    bool isDayTime = now.hour >= sunrise.hour && now.hour < sunset.hour;

    String imagePath =
        !isDayTime ? 'assets/images/day.jpg':'assets/images/night.jpg';

    return AssetImage(imagePath);  
  }
} 
    