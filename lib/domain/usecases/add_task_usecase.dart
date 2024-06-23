import 'package:tic_tak_game/domain/entities/entity.dart';
import 'package:tic_tak_game/domain/repository/repository.dart';

class AddTaskUsecase {
  final TaskRepository repository;

  AddTaskUsecase(this.repository);

  List<Task> call(int numberOfTasks, int sequenceOfTasks) {
    return repository.addTask(numberOfTasks, sequenceOfTasks);
  }
}
