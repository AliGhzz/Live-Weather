import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:live_weather/core/network/data_state.dart';
import 'package:live_weather/features/weather/domain/use_case/get_current_weather_usecase.dart';
import 'package:live_weather/features/weather/presentation/bloc/current_waether_bloc/cw_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUsecase getCurrentWeatherUsecase;
  HomeBloc(this.getCurrentWeatherUsecase)
      : super(HomeState(cwStatus: CwLoading(),failedNumber: 0)) {
    on<LoadCwEvent>((event, emit) async {
        emit(HomeState(cwStatus: CwLoading(), failedNumber: state.failedNumber));

        DataState dataState = await getCurrentWeatherUsecase(event.city);

        if (dataState is DataSuccess) {
          print("if (dataState is DataSuccess) {");
          emit(HomeState(cwStatus: CwCompleted(dataState.data), failedNumber: state.failedNumber));
          
        }

        if (dataState is DataFailed) {
          emit(HomeState(cwStatus: CwError("message"), failedNumber: state.failedNumber));
        }
      },
    );

    on<UpdateFailedNumber>((event, emit) {
      emit(HomeState(cwStatus: CwError("message"), failedNumber: state.failedNumber+event.value));
    });
  }
}
