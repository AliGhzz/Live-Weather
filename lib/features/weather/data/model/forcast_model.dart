import 'package:live_weather/features/weather/data/model/curreny_weather_model.dart';

class Forcast {
  List<FWeather>? forcasts;
  Forcast(this.forcasts);
  
  static Forcast convertJsonToForcast(Map<String, dynamic> json) {
    List forcastList = json['list'] as List;
    List<FWeather> fweatherList = [];

    for(int i=0;i<forcastList.length;i++){
      var json = forcastList[i];
      Weather weather = Weather(main:json['weather'][0]['main'] ,description:json['weather'][0]['description'] ,icon:json['weather'][0]['icon'] ,id:json['weather'][0]['id']);
      DateTime dateTime = DateTime.parse(json['dt_txt']);
      num temp = json['main']['temp'];
      FWeather fWeather = FWeather(weather: weather, dateTime: dateTime, temp: temp);
      fweatherList.add(fWeather);
    }

    Forcast forcasts = Forcast(fweatherList);
    return forcasts;
  }
  
}

class FWeather {
  Weather weather;
  DateTime dateTime;
  num temp;
  FWeather({required this.weather,required this.dateTime, required this.temp});
}



