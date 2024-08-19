import 'package:flutter/cupertino.dart';

class WeatherIcon {
  static dynamic setIcon(String iconCode, double size, Color color) {
    switch (iconCode) {
      case "01d":
        return Icon(
          CupertinoIcons.sun_max,
          size: size,
          color: color,
        );
      case "01n":
        return Icon(CupertinoIcons.moon, size: size, color: color);
      case "02d":
        return Icon(CupertinoIcons.cloud_sun, size: size, color: color);
      case "02n":
        return Icon(CupertinoIcons.cloud_moon, size: size, color: color);
      case "03d":
      case "03n":
        return Icon(CupertinoIcons.cloud, size: size, color: color);
      case "o4d":
      case "04n":
        return Icon(CupertinoIcons.smoke, size: size, color: color);
      case "09d":
      case "09n":
        return Icon(CupertinoIcons.cloud_rain, size: size, color: color);
      case "10d":
        return Icon(CupertinoIcons.cloud_sun_rain, size: size, color: color);
      case "10n":
        return Icon(CupertinoIcons.cloud_moon_rain, size: size, color: color);
      case "11d":
      case "11n":
        return Icon(CupertinoIcons.cloud_bolt, size: size, color: color);
      case "13d":
      case "13n":
        return Icon(CupertinoIcons.snow, size: size, color: color);
      default:
        return SizedBox(
            width: size * 1.33,
            height: size,
            child: Image.asset(
              "assets/images/other.png",
              color: color,
              fit: BoxFit.fitHeight,
            ));
    }
  }
}
