import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../ticker.dart';

part 'timer_event.dart';
part 'timer_state.dart';

//타이머 블록
class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;

  //초기시간
  static const int _duration = 60;

  //타이머틱 스트림 구독위한 변수, 구독취소시사용
  StreamSubscription<int>? _tickerSubscription;

  //초기화 및 초기상태 timerInitial로 설정 후 이벤트 발생시 메서드 호출
  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<_TimerTicked>(_onTicked);
  }

  //블럭 닫을때 호출
  @override
  Future<void> close() {
    print('닫음');
    _tickerSubscription?.cancel();
    return super.close();
  }

  //emit 은 그 상태 방출
  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    print('처음');
    emit(TimerRunInProgress(event.duration));
    print('시작');
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(_TimerTicked(duration: duration)));
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgress) {
      print('일시정지');
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration));
    }
  }

  void _onResumed(TimerResumed event, Emitter<TimerState> emit) {
    if (state is TimerRunPause) {
      print('재시작');
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration));
    }
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    print('초기화');
    _tickerSubscription?.cancel();
    emit(const TimerInitial(_duration));
  }

  void _onTicked(_TimerTicked event, Emitter<TimerState> emit) {
    print('여긴어디야');
    emit(
      event.duration > 0
          ? TimerRunInProgress(event.duration)
          : const TimerRunComplete(),
    );
  }
}
