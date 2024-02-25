import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_kvant/src/common/common.dart';
import 'package:todo_kvant/src/features/data/data.dart';

part 'task_client.g.dart';

@RestApi(baseUrl: ApiConfig.baseUrl)
abstract class TaskClient {
  factory TaskClient(Dio dio, {String baseUrl}) = _TaskClient;

  @GET(ApiConfig.taskUrl)
  Future<List<TaskModel>> getTask();
}
