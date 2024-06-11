import 'package:equatable/equatable.dart';
import 'package:tic_tak_game/domain/entities/entity.dart';

// Base state class
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

// Initial state
class TaskInitial extends TaskState {}

// Loading state
class TaskLoading extends TaskState {}

// Loaded state with tasks
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
  List<Object?> get props => [unassignedTasks, assignedTasks, completedTasks];
}

// Error state
class TaskError extends TaskState {
  final String message;

  const TaskError(this.message);

  @override
  List<Object?> get props => [message];
}
