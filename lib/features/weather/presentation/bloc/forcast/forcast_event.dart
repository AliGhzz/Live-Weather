part of 'forcast_bloc.dart';

sealed class ForcastEvent{
  const ForcastEvent();  
}

class GetForcastEvent extends ForcastEvent{
  String? city;
  GetForcastEvent(this.city);

}