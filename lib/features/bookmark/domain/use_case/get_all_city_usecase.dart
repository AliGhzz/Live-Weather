import '../../../../core/network/data_state.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entity/city_entity.dart';
import '../repository/city_repository.dart';


class GetAllCityUseCase implements UseCase<DataState<List<City>>, NoParams>{
  final CityRepository _cityRepository;
  GetAllCityUseCase(this._cityRepository);

  @override
  Future<DataState<List<City>>> call(NoParams params) {
    return _cityRepository.getAllCityFromDB();
  }
}