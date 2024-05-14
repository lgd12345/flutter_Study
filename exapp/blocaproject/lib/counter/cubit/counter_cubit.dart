import 'package:bloc/bloc.dart';

//카운터 큐빗
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  //int 초기상태는 0 이고 현재 상태에 1 추가 , 1 빼기

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

}