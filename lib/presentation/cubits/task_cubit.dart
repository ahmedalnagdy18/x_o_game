// lib/presentation/cubit/task_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:tic_tak_game/domain/entities/entity.dart';
import 'package:tic_tak_game/domain/usecases/add_task_usecase.dart';
import 'package:tic_tak_game/domain/usecases/assign_task_usecase.dart';
import 'package:tic_tak_game/domain/usecases/complete_task_usecase.dart';
import 'package:tic_tak_game/domain/usecases/reload_task_usecase.dart';
import 'package:tic_tak_game/domain/usecases/remove_task_usecase.dart';
import 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final AddTask addTaskUseCase;
  final AssignTask assignTaskUseCase;
  final CompleteTask completeTaskUseCase;
  final RemoveTask removeTaskUseCase;
  final ReloadTasks reloadTasksUseCase;

  TaskCubit({
    required this.addTaskUseCase,
    required this.assignTaskUseCase,
    required this.completeTaskUseCase,
    required this.removeTaskUseCase,
    required this.reloadTasksUseCase,
  }) : super(TaskInitial());

  void loadTasks() {
    // Load tasks using repository streams
    // Listen to task streams and emit states accordingly
    // This is a placeholder; actual implementation will depend on the repository
  }

  void addTask(Task task) async {
    try {
      emit(TaskLoading());
      await addTaskUseCase(task);
      emit(TaskInitial());
      loadTasks();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void assignTask(Task task) async {
    try {
      emit(TaskLoading());
      await assignTaskUseCase(task);
      emit(TaskInitial());
      loadTasks();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void completeTask(Task task) async {
    try {
      emit(TaskLoading());
      await completeTaskUseCase(task);
      emit(TaskInitial());
      loadTasks();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void removeTask(Task task) async {
    try {
      emit(TaskLoading());
      await removeTaskUseCase(task);
      emit(TaskInitial());
      loadTasks();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void reloadTasks() async {
    try {
      emit(TaskLoading());
      await reloadTasksUseCase();
      emit(TaskInitial());
      loadTasks();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }
}
