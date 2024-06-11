import 'package:flutter/material.dart';
import 'package:tic_tak_game/presentation/widgets/tasks_body_widget.dart';

class UnAssignedPage extends StatelessWidget {
  final int? numberOfTasks;
  final int? sequenceOfTasks;

  const UnAssignedPage(
      {super.key, this.numberOfTasks, required this.sequenceOfTasks});

  @override
  Widget build(BuildContext context) {
    return TasksBody(
      numberOfTasks: numberOfTasks ?? 0,
      sequenceOfTasks: sequenceOfTasks ?? 0,
    );
  }
}
