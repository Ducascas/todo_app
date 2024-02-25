import 'package:dartz/dartz.dart';
import 'package:todo_kvant/src/common/common.dart';
import 'package:todo_kvant/src/features/data/data.dart';
import 'package:todo_kvant/src/features/domain/domain.dart';

class GetTaskUseCase implements UseCase<List<TaskModel>, GetTaskParams> {
  final TaskRepository taskRepository;

  GetTaskUseCase(this.taskRepository);

  @override
  Future<Either<String, List<TaskModel>>> call(GetTaskParams params) async {
    return await taskRepository.getTask(params.userId);
  }
}

class GetTaskParams {
  final int userId;

  GetTaskParams({required this.userId});
}
