import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// This Cubit is used when the user swipes left or right to rebuild the active bottom navigation bar item.
class ChangeScreenCubit extends Cubit<int> {
  ChangeScreenCubit() : super(0);

  void changeScreen(int value){
    emit(value);
  }
}
