import '../../../../core/network/data_state.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repository/city_repository.dart';

class DeleteCityUseCase implements UseCase<DataState<String>, String>{
  final CityRepository _cityRepository;
  DeleteCityUseCase(this._cityRepository);

  @override
  Future<DataState<String>> call(String params) {
    return _cityRepository.deleteCityByName(params);
  }
}