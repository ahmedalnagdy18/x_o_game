import 'dart:async';

import 'package:tic_tak_game/domain/entities/entity.dart';
import 'package:tic_tak_game/domain/repository/repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final List<Task> _unassignedTasks = [];
  final List<Task> _assignedTasks = [];
  final List<Task> _completedTasks = [];
  Task? _currentTask;

  final StreamController<List<Task>> _unassignedController =
      StreamController.broadcast();
  final StreamController<List<Task>> _assignedController =
      StreamController.broadcast();
  final StreamController<List<Task>> _completedController =
      StreamController.broadcast();

  @override
  Future<void> addTask(Task task) async {
    _unassignedTasks.add(task);
    _unassignedController.add(_unassignedTasks);
  }

  @override
  Future<void> assignTask(Task task) async {
    if (_currentTask == null) {
      _currentTask = task;
      _unassignedTasks.remove(task);
      _assignedTasks.add(task);
      _unassignedController.add(_unassignedTasks);
      _assignedController.add(_assignedTasks);
    } else {
      throw Exception('A task is already assigned.');
    }
  }

  @override
  Future<void> completeTask(Task task) async {
    _assignedTasks.remove(task);
    _completedTasks.add(task);
    _currentTask = null;
    _assignedController.add(_assignedTasks);
    _completedController.add(_completedTasks);
  }

  @override
  Future<void> removeTask(Task task) async {
    _unassignedTasks.remove(task);
    _assignedTasks.remove(task);
    _unassignedController.add(_unassignedTasks);
    _assignedController.add(_assignedTasks);
  }

  @override
  Future<void> reloadTasks() async {
    // Logic to reload tasks
    _unassignedController.add(_unassignedTasks);
  }

  @override
  Stream<List<Task>> watchUnassignedTasks() => _unassignedController.stream;

  @override
  Stream<List<Task>> watchAssignedTasks() => _assignedController.stream;

  @override
  Stream<List<Task>> watchCompletedTasks() => _completedController.stream;
}
