import 'package:flutter/material.dart';
import 'package:live_weather/core/utils/time_formatter.dart';
import 'package:live_weather/core/widgets/weather_icon.dart';
import 'package:live_weather/features/weather/data/model/forcast_model.dart';

class ForcastWidget extends StatelessWidget {
  List<FWeather> fWeather;
  ForcastWidget({super.key,required this.fWeather});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: fWeather.length-2,
      itemBuilder: (context, index) {
        FWeather fWeatherItem = fWeather[index+2];
        return Container(
          width: 70,
          child: Card(
            color:  Colors.transparent,
            elevation: 0,
            child: Column(
              children: [
                Text(
                  TimeFormatter.getDayAndMonth(fWeatherItem.dateTime),
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.white),
                ),
                Spacer(),
                
                Text(
                  TimeFormatter.getTime(fWeatherItem.dateTime),
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.white),
                ),
                Spacer(),
                WeatherIcon.setIcon(
                    fWeatherItem.weather.icon!,
                    20,Colors.white),
                Spacer(),
                Text(
                    fWeatherItem.temp!.toString()+
                        "\u2103",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12)),
              ],
            ),
          ),
        );
      },
  
    
    );
  }
}