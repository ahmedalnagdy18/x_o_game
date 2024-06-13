import 'package:tic_tak_game/domain/entities/entity.dart';
import 'package:tic_tak_game/domain/repository/repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final List<Task> alltasks = [];

  @override
  List<Task> addTask(int numberOfTasks, int sequenceOfTasks) {
    for (var i = 0; i < numberOfTasks; i++) {
      alltasks.add(Task(
          name: 'Task ${i + 1}', duration: sequenceOfTasks * 60 + i * 5 * 60));
    }
    return alltasks;
  }
}
