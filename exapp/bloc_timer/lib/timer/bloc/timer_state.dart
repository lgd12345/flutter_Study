part of 'timer_bloc.dart';

// 타이머 상태인 모든 블록파일을 함께 저장한다
sealed class TimerState extends Equatable {
  const TimerState(this.duration);
  final int duration;

  List<Object> get props => [duration];
}

//지정된 기간부터 카운트다운할 준비 (사용자가 시작할 수 있음)
final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}
//지정된 기간부터 카운트다운 한다 (사용자가 일시중지, 재설정, 남은시간확인가능)
final class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}
//남은시간동안 일시중지 (사용자가 타이머 재개, 타이머 재설정가능)
final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}
// 남은 지속시간이 '0' 완료됨 (타이머 재설정가능)
final class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}