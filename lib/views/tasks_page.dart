import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_task_nearcast/bloc/tasks/tasks_bloc.dart';
import 'package:timer_task_nearcast/models/task.dart';
import 'package:timer_task_nearcast/views/task_create_page.dart';
import 'package:timer_task_nearcast/views/tasks_list.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasks")),
      body: ColoredBox(
        color: Colors.grey.shade200,
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: TasksList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addDummyTask(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addDummyTask(context) {
    BlocProvider.of<TasksBloc>(context).add(
      TaskAdded(
        Task(
          title: Random().nextInt(30).toString(),
          description: "Description 1",
          durationRemain: const Duration(seconds: 10),
          isActive: true,
        ),
      ),
    );
  }
}
