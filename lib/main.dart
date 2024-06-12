import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tak_game/presentation/cubits/cubit/tasks_cubit.dart';

import 'package:tic_tak_game/presentation/pages/add_task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TasksCubit>(
      create: (BuildContext context) {
        return TasksCubit();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AddTaskPage(),
      ),
    );
  }
}
