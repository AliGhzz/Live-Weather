import 'package:get_it/get_it.dart';
import 'package:live_weather/features/bookmark/data/data_source/local/database.dart';
import 'package:live_weather/features/bookmark/data/repository/city_repositoryimpl.dart';
import 'package:live_weather/features/bookmark/domain/repository/city_repository.dart';
import 'package:live_weather/features/bookmark/domain/use_case/delete_city_usecase.dart';
import 'package:live_weather/features/bookmark/domain/use_case/get_all_city_usecase.dart';
import 'package:live_weather/features/bookmark/domain/use_case/get_city_usecase.dart';
import 'package:live_weather/features/bookmark/domain/use_case/save_city_usecase.dart';
import 'package:live_weather/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:live_weather/features/weather/data/data_source/remote/api_provider.dart';
import 'package:live_weather/features/weather/data/repository/forcast_repository_impl.dart';
import 'package:live_weather/features/weather/data/repository/weather_repository_impl.dart';
import 'package:live_weather/features/weather/domain/repository/weather_repository.dart';
import 'package:live_weather/features/weather/domain/use_case/get_current_weather_usecase.dart';
import 'package:live_weather/features/weather/presentation/bloc/current_waether_bloc/home_bloc.dart';
import 'package:live_weather/features/weather/presentation/bloc/forcast/forcast_bloc.dart';

GetIt locator = GetIt.instance;

setup() async {
  locator.registerSingleton<ApiProvider>(ApiProvider());

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(database);
  
  locator.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));
  locator.registerSingleton<ForcastRepository>(ForcastRepository(locator()));
  locator.registerSingleton<GetCurrentWeatherUsecase>(GetCurrentWeatherUsecase(locator()));

  locator.registerSingleton(ForcastBloc(locator()));
  locator.registerSingleton(HomeBloc(locator()));

  locator.registerSingleton<CityRepository>(CityRepositoryImpl(database.cityDao));

  // locator.registerSingleton<GetForecastWeatherUseCase>(GetForecastWeatherUseCase(locator()));
  locator.registerSingleton<GetCityUseCase>(GetCityUseCase(locator()));
  locator.registerSingleton<SaveCityUseCase>(SaveCityUseCase(locator()));
  locator.registerSingleton<GetAllCityUseCase>(GetAllCityUseCase(locator()));
  locator.registerSingleton<DeleteCityUseCase>(DeleteCityUseCase(locator()));



  // locator.registerSingleton<HomeBloc>(HomeBloc(locator(),locator()));
  locator.registerSingleton<BookmarkBloc>(BookmarkBloc(locator(),locator(),locator(),locator()));
}
