part of 'timer_bloc.dart';

@immutable
abstract class TimerState extends Equatable {
  final int? elapsed;
  const TimerState(this.elapsed);
}

abstract class TimerActionState extends TimerState {
  const TimerActionState(super.elapsed);
}

class TimerInitial extends TimerState {
  const TimerInitial() : super(0);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TimerProgress extends TimerState {
  const TimerProgress(int? elapsed) : super(elapsed);

  @override
  // TODO: implement props
  // As we passed the "elapsed" value, it becomes Stateful, which means it can change and the UI will know about it.
  List<Object?> get props => [elapsed];
}

//class TimerPlayState extends TimerState {}





/* part of 'timer_bloc.dart';

@immutable
abstract class TimerState extends Equatable {
  final int? elapsed;
  const TimerState(this.elapsed);
}

abstract class TimerActionState extends TimerState {
  const TimerActionState(super.elapsed);
}

class TimerInitial extends TimerState {
  const TimerInitial() : super(0);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TimerProgress extends TimerState {
  const TimerProgress(int? elapsed) : super(elapsed);

  @override
  // TODO: implement props
  // As we passed the "elapsed" value, it becomes Stateful, which means it can change and the UI will know about it.
  List<Object?> get props => [elapsed];
}

//class TimerPlayState extends TimerState {}
 */