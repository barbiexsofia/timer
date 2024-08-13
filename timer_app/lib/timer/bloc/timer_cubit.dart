import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:timer_app/timer/bloc/timer_bloc.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerInitial());

  Timer? _timer;

  startTimer([int? time]) {
    if (time != null) {
      emit(TimerProgress(time));
    } else {
      emit(const TimerProgress(0));
    }

    // This is the core of the app. Every "duration" (1 second), it calls a function (onTick).
    _timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  onTick(Timer timer) {
    if (state is TimerProgress) {
      //convert the state to a variable (so we can access its contents)
      // and make sure it's the right type of state, i.e. TimerProgess
      TimerProgress wip = state as TimerProgress;
      if (wip.elapsed! < 5) {
        emit(TimerProgress(wip.elapsed! + 1));
      } else {
        _timer!.cancel();
        emit(const TimerInitial());
      }
    }
  }
}
