import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_kvant/src/features/data/data.dart';
import 'package:todo_kvant/src/features/domain/domain.dart';

class TaskController extends GetxController with StateMixin<List<TaskModel>> {
  static TaskController get call => Get.find();
  final GetTaskUseCase getTaskUseCase;

  TaskController({required this.getTaskUseCase});

  late TextEditingController textEditingController = TextEditingController();
  RxList<TaskModel> taskList = <TaskModel>[].obs;
  final taskStatus = false.obs;

  addTask(List<TaskModel> list, TaskModel task) {
    list.add(task);
    update();
  }

  editTask(List<TaskModel> list, TaskModel task, int index) {
    list[index] = task;
    update();
  }

  FutureOr<void> getTaskList() async {
    change(null, status: RxStatus.loading());

    Either<String, List<TaskModel>> failureOrSuccess =
        await getTaskUseCase(GetTaskParams(userId: 1));

    failureOrSuccess.fold(
      (String failure) {
        change(null, status: RxStatus.error(failure));
      },
      (List<TaskModel> task) {
        taskList = task.sublist(0, 5).obs;

        if (taskList.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(task, status: RxStatus.success());
        }
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
  }
}
