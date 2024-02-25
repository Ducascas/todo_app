import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:todo_kvant/src/features/data/data.dart';
import 'package:todo_kvant/src/features/domain/domain.dart';
import 'package:todo_kvant/src/features/presentation/presentation.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //Task Controller
  getIt.registerFactory(() => TaskController(getTaskUseCase: getIt()));

  // Task UseCases
  getIt.registerLazySingleton(() => GetTaskUseCase(getIt<TaskRepository>()));

  // Task Repository
  getIt.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(taskClient: getIt()),
  );

  // Task DataSources
  getIt.registerLazySingleton<TaskClient>(() => TaskClient(getIt()));

  //Dio
  getIt.registerLazySingleton<Dio>(() => Dio());
}
