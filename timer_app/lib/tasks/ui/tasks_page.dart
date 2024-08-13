import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/tasks/bloc/task_bloc.dart';
import 'package:timer_app/tasks/models/task_model.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoaded) {
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return ListTile(
                  title: Text(task.name),
                  subtitle: Text(task.description),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      BlocProvider.of<TaskBloc>(context)
                          .add(TaskDeleteTask(index: index));
                    },
                  ),
                  onTap: () {
                    _editTaskDialog(context, index, task);
                  },
                );
              },
            );
          }
          return const Center(
              child: Column(
                  children: [Text("OOOPS"), CircularProgressIndicator()]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTaskDialog(BuildContext context) {
    String name = '';
    String description = '';
    int duration = 0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (value) => description = value,
              ),
              TextField(
                decoration:
                    const InputDecoration(labelText: 'Duration (minutes)'),
                keyboardType: TextInputType.number,
                onChanged: (value) => duration = int.tryParse(value) ?? 0,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty && description.isNotEmpty) {
                  final task = Task(
                    id: DateTime.now().toString(),
                    name: name,
                    description: description,
                    createdAt: DateTime.now(),
                    duration: duration,
                  );
                  BlocProvider.of<TaskBloc>(context)
                      .add(TaskAddTask(task: task));
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _editTaskDialog(BuildContext context, int index, Task task) {
    String name = task.name;
    String description = task.description;
    int duration = task.duration;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: TextEditingController(text: name),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                controller: TextEditingController(text: description),
                onChanged: (value) => description = value,
              ),
              TextField(
                decoration:
                    const InputDecoration(labelText: 'Duration (minutes)'),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: duration.toString()),
                onChanged: (value) => duration = int.tryParse(value) ?? 0,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty && description.isNotEmpty) {
                  final updatedTask = Task(
                    id: task.id,
                    name: name,
                    description: description,
                    createdAt: task.createdAt,
                    duration: duration,
                  );
                  BlocProvider.of<TaskBloc>(context).add(
                      TaskUpdateTask(index: index, updatedTask: updatedTask));
                }
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
