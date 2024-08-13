part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent {}

class TimerPlayEvent extends TimerEvent {}

class TimerStopEvent extends TimerEvent {}

class TimerChangeTimeEvent extends TimerEvent {}
