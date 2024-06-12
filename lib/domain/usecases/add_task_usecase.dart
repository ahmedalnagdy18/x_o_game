import 'package:tic_tak_game/domain/entities/entity.dart';
import 'package:tic_tak_game/domain/repository/repository.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  List<Task> call(int numberOfTasks, int sequenceOfTasks) {
    return repository.addTask(numberOfTasks, sequenceOfTasks);
  }
}
