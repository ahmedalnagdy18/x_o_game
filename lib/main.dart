import 'package:flutter/material.dart';
import 'package:tic_tak_game/presentation/pages/add_task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddTaskPage(),
    );
  }
}
