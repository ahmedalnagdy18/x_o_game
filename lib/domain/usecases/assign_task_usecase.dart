import 'package:tic_tak_game/domain/entities/entity.dart';
import 'package:tic_tak_game/domain/repository/repository.dart';

class AssignTask {
  final TaskRepository repository;

  AssignTask(this.repository);

  Future<void> call(Task task) {
    return repository.assignTask(task);
  }
}
