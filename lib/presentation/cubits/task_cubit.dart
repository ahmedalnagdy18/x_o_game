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
  }) : super(TaskInitial()) {
    loadTasks();
  }

  void loadTasks() {
    emit(TaskLoading());
    try {
      reloadTasksUseCase();
      reloadTasksUseCase.repository
          .watchUnassignedTasks()
          .listen((unassignedTasks) {
        _updateTasks(unassignedTasks, null, null);
      });
      reloadTasksUseCase.repository
          .watchAssignedTasks()
          .listen((assignedTasks) {
        _updateTasks(null, assignedTasks, null);
      });
      reloadTasksUseCase.repository
          .watchCompletedTasks()
          .listen((completedTasks) {
        _updateTasks(null, null, completedTasks);
      });
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void _updateTasks(List<Task>? unassignedTasks, List<Task>? assignedTasks,
      List<Task>? completedTasks) {
    final currentState = state;
    if (currentState is TaskLoaded) {
      emit(TaskLoaded(
        unassignedTasks: unassignedTasks ?? currentState.unassignedTasks,
        assignedTasks: assignedTasks ?? currentState.assignedTasks,
        completedTasks: completedTasks ?? currentState.completedTasks,
      ));
    } else {
      emit(TaskLoaded(
        unassignedTasks: unassignedTasks ?? [],
        assignedTasks: assignedTasks ?? [],
        completedTasks: completedTasks ?? [],
      ));
    }
  }

  void addTask(Task task) async {
    try {
      emit(TaskLoading());
      await addTaskUseCase(task);
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void assignTask(Task task) async {
    try {
      emit(TaskLoading());
      await assignTaskUseCase(task);
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void completeTask(Task task) async {
    try {
      emit(TaskLoading());
      await completeTaskUseCase(task);
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void removeTask(Task task) async {
    try {
      emit(TaskLoading());
      await removeTaskUseCase(task);
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  void reloadTasks() async {
    try {
      emit(TaskLoading());
      await reloadTasksUseCase();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }
}
