part of 'task_bloc.dart';

@immutable
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;

  const TaskLoaded({this.tasks = const []});

  @override
  List<Object?> get props => [tasks];
}
