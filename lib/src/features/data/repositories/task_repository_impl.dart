import 'package:dartz/dartz.dart';
import 'package:todo_kvant/src/common/utils/utils.dart';
import 'package:todo_kvant/src/features/data/data.dart';
import 'package:todo_kvant/src/features/data/models/models.dart';
import 'package:todo_kvant/src/features/domain/domain.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskClient taskClient;

  TaskRepositoryImpl({required this.taskClient});

  @override
  Future<Either<String, List<TaskModel>>> getTask(int userId) async {
    return await _getTask(() {
      return taskClient.getTask();
    });
  }

  Future<Either<String, List<TaskModel>>> _getTask(
      Future<List<TaskModel>> Function() getTask) async {
    try {
      final remoteTask = await getTask();
      return Right(remoteTask);
    } on ServerException {
      final errorMessage = ServerException().toString();
      return Left(errorMessage);
    }
  }
}
