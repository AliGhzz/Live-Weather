import 'package:live_weather/core/network/data_state.dart';
import 'package:live_weather/core/use_cases/use_case.dart';
import 'package:live_weather/features/weather/domain/entity/current_weather_entity.dart';
import 'package:live_weather/features/weather/domain/repository/weather_repository.dart';

class GetCurrentWeatherUsecase
    extends UseCase<DataState<CurrentWeatherEntity>, String> {
  final WeatherRepository weatherRepository;
  GetCurrentWeatherUsecase(this.weatherRepository);

  @override
  Future<DataState<CurrentWeatherEntity>> call(String city) {
    return weatherRepository.fethCurrentWeatherData(city);
  }
}
