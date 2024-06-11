// lib/di.dart
import 'package:get_it/get_it.dart';
import 'package:tic_tak_game/data/repository/repository_imp.dart';
import 'package:tic_tak_game/domain/repository/repository.dart';
import 'package:tic_tak_game/domain/usecases/add_task_usecase.dart';
import 'package:tic_tak_game/domain/usecases/assign_task_usecase.dart';
import 'package:tic_tak_game/domain/usecases/complete_task_usecase.dart';
import 'package:tic_tak_game/domain/usecases/reload_task_usecase.dart';
import 'package:tic_tak_game/domain/usecases/remove_task_usecase.dart';
import 'package:tic_tak_game/presentation/cubits/task_cubit.dart';

GetIt sl = GetIt.instance;

void init() {
  // Cubit
  sl.registerFactory(() => TaskCubit(
        addTaskUseCase: sl(),
        assignTaskUseCase: sl(),
        completeTaskUseCase: sl(),
        removeTaskUseCase: sl(),
        reloadTasksUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => AddTask(sl()));
  sl.registerLazySingleton(() => AssignTask(sl()));
  sl.registerLazySingleton(() => CompleteTask(sl()));
  sl.registerLazySingleton(() => RemoveTask(sl()));
  sl.registerLazySingleton(() => ReloadTasks(sl()));

  // Repository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl());
}
