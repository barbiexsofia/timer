part of 'task_bloc.dart';

@immutable
abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class TaskLoadTasks extends TaskEvent {}

class TaskAddTask extends TaskEvent {
  final Task task;

  const TaskAddTask({required this.task});

  @override
  List<Object?> get props => [task];
}

class TaskUpdateTask extends TaskEvent {
  final int index;
  final Task updatedTask;

  const TaskUpdateTask({required this.index, required this.updatedTask});

  @override
  List<Object?> get props => [index, updatedTask];
}

class TaskDeleteTask extends TaskEvent {
  final int index;

  const TaskDeleteTask({required this.index});

  @override
  List<Object?> get props => [index];
}
