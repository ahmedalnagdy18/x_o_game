import 'package:tic_tak_game/domain/entities/entity.dart';
import 'package:tic_tak_game/domain/repository/repository.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  Future<void> call(Task task) {
    return repository.addTask(task);
  }
}
