import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:live_weather/core/network/data_state.dart';
import 'package:live_weather/features/weather/data/model/forcast_model.dart';
import 'package:live_weather/features/weather/data/repository/forcast_repository_impl.dart';

part 'forcast_event.dart';
part 'forcast_state.dart';

class ForcastBloc extends Bloc<ForcastEvent, ForcastState> {
  final ForcastRepository forcastRepository;
  ForcastBloc(this.forcastRepository) : super(ForcastState(fState: ForcastLoading())) {

    on<GetForcastEvent>((event, emit) async{
      emit(ForcastState(fState: ForcastLoading()));
      DataState dataState =await forcastRepository.fetchForcasts(city: event.city!);
      if (dataState is DataSuccess){
        emit(ForcastState(fState: ForcastLoaded(forcast: dataState.data)));
      }
      if(dataState is DataFailed){
        emit(ForcastState(fState: ForcastError()));
      }
    });
  }
}
