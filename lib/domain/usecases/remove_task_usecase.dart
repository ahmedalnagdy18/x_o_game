import 'package:tic_tak_game/domain/entities/entity.dart';
import 'package:tic_tak_game/domain/repository/repository.dart';

class RemoveTask {
  final TaskRepository repository;

  RemoveTask(this.repository);

  Future<void> call(Task task) {
    return repository.removeTask(task);
  }
}
