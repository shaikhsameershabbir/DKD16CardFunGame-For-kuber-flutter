part of 'timer_cubit.dart';

abstract class TimerState {}

class TimerInitial extends TimerState {}

class TimerAuthSocketConnected extends TimerState {}

class TimerUpdated extends TimerState {
  final int seconds;
  TimerUpdated(this.seconds);
}

class TimerAuthSocketDisconnected extends TimerState {}

class TimerAuthSocketError extends TimerState {
  final String errorMessage;
  TimerAuthSocketError(this.errorMessage);
}
