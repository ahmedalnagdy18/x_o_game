import 'package:tic_tak_game/domain/entities/entity.dart';

abstract class TasksState {
  const TasksState();
}

final class TasksInitial extends TasksState {}

final class TasksLoad extends TasksState {
  List<Task> tasks;

  TasksLoad({required this.tasks});
}
