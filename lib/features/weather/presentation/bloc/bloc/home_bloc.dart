import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:live_weather/core/network/data_state.dart';
import 'package:live_weather/features/weather/domain/use_case/get_current_weather_usecase.dart';
import 'package:live_weather/features/weather/presentation/bloc/bloc/cw_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUsecase getCurrentWeatherUsecase;
  HomeBloc(this.getCurrentWeatherUsecase)
      : super(HomeState(cwStatus: CwLoading())) {
    on<LoadCwEvent>(
      (event, emit) async {
        emit(state.copyWith(newCwStatus: CwLoading()));

        DataState dataState = await getCurrentWeatherUsecase(event.city);

        if (dataState is DataSuccess) {
          emit(state.copyWith(newCwStatus: CwCompleted(dataState.data)));
        }

        if (dataState is DataFailed) {
          emit(state.copyWith(
              newCwStatus: CwError(dataState.data ?? 'null message')));
        }
      },
    );
  }
}
