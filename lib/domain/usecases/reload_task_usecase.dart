import 'package:tic_tak_game/domain/repository/repository.dart';

class ReloadTasks {
  final TaskRepository repository;

  ReloadTasks(this.repository);

  Future<void> call() {
    return repository.reloadTasks();
  }
}
