
import 'package:live_weather/core/use_cases/use_case.dart';
import 'package:live_weather/features/weather/data/model/suggest_city_model.dart';

import '../repository/weather_repository.dart';

class GetSuggestionCityUseCase implements UseCase<List<Data>, String>{
  final WeatherRepository _weatherRepository;
  GetSuggestionCityUseCase(this._weatherRepository);

  @override
  Future<List<Data>> call(String params) {
    return _weatherRepository.fetchSuggestData(params);
  }

}