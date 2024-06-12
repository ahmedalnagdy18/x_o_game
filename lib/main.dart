import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tak_game/di.dart';

import 'package:tic_tak_game/domain/usecases/add_task_usecase.dart';
import 'package:tic_tak_game/presentation/cubits/cubit/tasks_cubit.dart';

import 'package:tic_tak_game/presentation/pages/add_task_page.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TasksCubit>(
      create: (BuildContext context) {
        return TasksCubit(sl.get<AddTask>());
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AddTaskPage(),
      ),
    );
  }
}
