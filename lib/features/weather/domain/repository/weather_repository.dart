import 'package:live_weather/core/network/data_state.dart';
import 'package:live_weather/features/weather/data/model/suggest_city_model.dart';
import 'package:live_weather/features/weather/domain/entity/current_weather_entity.dart';

abstract class WeatherRepository {
  Future<DataState<CurrentWeatherEntity>> fethCurrentWeatherData(String city);

  Future<List<Data>> fetchSuggestData(cityName);

}
