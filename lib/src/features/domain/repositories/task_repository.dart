import 'package:dartz/dartz.dart';
import 'package:todo_kvant/src/features/data/data.dart';

abstract class TaskRepository {
  Future<Either<String, List<TaskModel>>> getTask(int userId);
}