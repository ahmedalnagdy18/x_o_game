import 'package:tic_tak_game/domain/entities/entity.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<void> assignTask(Task task);
  Future<void> completeTask(Task task);
  Future<void> removeTask(Task task);
  Future<void> reloadTasks();
  Stream<List<Task>> watchUnassignedTasks();
  Stream<List<Task>> watchAssignedTasks();
  Stream<List<Task>> watchCompletedTasks();
}
