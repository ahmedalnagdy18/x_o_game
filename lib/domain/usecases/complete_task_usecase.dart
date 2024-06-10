import 'package:tic_tak_game/domain/entities/entity.dart';
import 'package:tic_tak_game/domain/repository/repository.dart';

class CompleteTask {
  final TaskRepository repository;

  CompleteTask(this.repository);

  Future<void> call(Task task) {
    return repository.completeTask(task);
  }
}
