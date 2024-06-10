// lib/presentation/cubit/task_state.dart
import 'package:equatable/equatable.dart';
import 'package:tic_tak_game/domain/entities/entity.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> unassignedTasks;
  final List<Task> assignedTasks;
  final List<Task> completedTasks;

  const TaskLoaded({
    required this.unassignedTasks,
    required this.assignedTasks,
    required this.completedTasks,
  });

  @override
  List<Object> get props => [unassignedTasks, assignedTasks, completedTasks];
}

class TaskError extends TaskState {
  final String message;

  const TaskError(this.message);

  @override
  List<Object> get props => [message];
}
