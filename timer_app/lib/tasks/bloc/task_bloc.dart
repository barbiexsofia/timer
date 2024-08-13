import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:timer_app/tasks/models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskLoadTasks>((event, emit) {
      print("Loading tasks..."); // Debugging line

      emit(const TaskLoaded());
    });

    on<TaskAddTask>((event, emit) {
      final state = this.state;
      if (state is TaskLoaded) {
        emit(TaskLoaded(tasks: List.from(state.tasks)..add(event.task)));
      }
    });
    on<TaskUpdateTask>((event, emit) {
      final state = this.state;
      if (state is TaskLoaded) {
        final List<Task> updatedTasks = List.from(state.tasks);
        updatedTasks[event.index] = event.updatedTask;
        emit(TaskLoaded(tasks: updatedTasks));
        print("Task updated..."); // Debugging line
      }
    });

    on<TaskDeleteTask>((event, emit) {
      final state = this.state;
      if (state is TaskLoaded) {
        final List<Task> updatedTasks = List.from(state.tasks)
          ..removeAt(event.index);
        emit(TaskLoaded(tasks: updatedTasks));
      }
    });

    add(TaskLoadTasks());
  }
}
