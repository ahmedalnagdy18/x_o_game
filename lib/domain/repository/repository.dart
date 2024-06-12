import 'package:tic_tak_game/domain/entities/entity.dart';

abstract class TaskRepository {
  List<Task> addTask(int numberOfTasks, int sequenceOfTasks);
}
