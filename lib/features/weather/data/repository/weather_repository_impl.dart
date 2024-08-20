import 'package:dio/dio.dart';
import 'package:live_weather/core/network/data_state.dart';
import 'package:live_weather/features/weather/data/data_source/remote/api_provider.dart';
import 'package:live_weather/features/weather/data/model/curreny_weather_model.dart';
import 'package:live_weather/features/weather/domain/entity/current_weather_entity.dart';
import 'package:live_weather/features/weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  ApiProvider apiProvider;
  WeatherRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<CurrentWeatherEntity>> fethCurrentWeatherData(String city) async {
    try {
      Response response = await apiProvider.getCurrentWeather(city: city);
      if (response.statusCode == 200) {
        CurrentWeatherEntity currentWeatherEntity =
            CurrentWeather.fromJson(response.data);
        return DataSuccess(currentWeatherEntity);
      } else {
        return const DataFailed("Something Went Wrong. try again ...");
      }
    } catch (e) {
      return const DataFailed("Please Check your connection");
    }
  }
}
