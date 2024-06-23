// lib/di.dart
import 'package:get_it/get_it.dart';
import 'package:tic_tak_game/data/repository/repository_imp.dart';
import 'package:tic_tak_game/domain/repository/repository.dart';
import 'package:tic_tak_game/domain/usecases/add_task_usecase.dart';
import 'package:tic_tak_game/presentation/cubits/cubit/tasks_cubit.dart';

GetIt sl = GetIt.instance;

void init() {
  // Cubit
  sl.registerFactory(() => TasksCubit(sl()));

  // Use cases
  sl.registerLazySingleton(() => AddTaskUsecase(sl()));

  // Repository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl());
}
