import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_kvant/src/features/domain/domain.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel extends TaskEntity with _$TaskModel {
   factory TaskModel({ int? userId, int? id,  String? title,  bool? completed}) =
      _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);
}
