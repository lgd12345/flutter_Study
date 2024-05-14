part of 'timer_bloc.dart';
// 타이머이벤트를 처리한다.

sealed class TimerEvent {
  const TimerEvent();
}

// 타이머가 시작되어야 하는 것을 블록에 알림
final class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});
  final int duration;
}
// 타이머가 일시중지되어야 하는 것을 블록에 알림
final class TimerPaused extends TimerEvent {
 const TimerPaused();
}
//타이머가 재개되어야 하는 것을 블록에 알림
final class TimerResumed extends TimerEvent {
  const TimerResumed();
}
//타이머가 원래상태로 재설정해야 하는 것을 블록에 알림
class TimerReset extends TimerEvent {
  const TimerReset();
}
//블록에 틱이 발생했고 이때 따라 상태를 업데이트 해야함을 알림
class _TimerTicked extends TimerEvent {
  const _TimerTicked({required this.duration});
  final int duration;
}