import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:tic_tak_game/domain/entities/entity.dart';
import 'package:tic_tak_game/domain/usecases/add_task_usecase.dart';

import 'package:tic_tak_game/presentation/cubits/cubit/tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  Timer? _timer;
  Task? assignedTask;
  final AddTaskUsecase addTaskUseCase;
  TasksCubit(this.addTaskUseCase) : super(TasksInitial());
  List<Task> completetasks = [];
  List<Task> tasks = [];

  getTasks(int numberOfTasks, int sequenceOfTasks) {
    tasks = addTaskUseCase(numberOfTasks, sequenceOfTasks);
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final updatedTasks =
          tasks.where((task) => task.endTime.isAfter(now)).toList();
      emit(TasksLoad(tasks: updatedTasks));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  completetask(Task completedtasks) {
    completetasks.add(completedtasks);
    tasks.remove(completedtasks);
  }
}
