import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_kvant/src/common/common.dart';
import 'package:todo_kvant/src/features/data/data.dart';
import 'package:todo_kvant/src/features/presentation/presentation.dart';

class TaskListScreen extends StatelessWidget {
  TaskListScreen({super.key, required this.taskList});

  List<TaskModel> taskList;

  final TaskController controller = getIt<TaskController>();

  // @override
  @override
  Widget build(BuildContext context) {
    List<TaskModel> _taskList = [];
    _getTaskList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          appTitle,
          style: taskTextStyle,
        ),
      ),
      body: controller.obx((state) {
        if (taskList.isEmpty) {
          _taskList = controller.taskList;
        } else {
          _taskList = taskList;
        }

        return ListView.builder(
          itemCount: _taskList.length,
          itemBuilder: (context, index) {
            TaskModel _taskModel = _taskList[index];
            int? _taskId = _taskList[index].id;
            String _taskTitle = _taskList[index].title ?? '';
            bool _taskStatus = _taskList[index].completed ?? false;

            return Card(
              color: tdWhite,
              elevation: 14,
              margin: const EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () async {
                    await Get.to(
                      () => TaskEditScreen(
                        taskList: _taskList,
                        taskModel: _taskModel,
                        index: index,
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _taskId.toString(),
                        style: taskTextStyle,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          _taskTitle.toCapitalized(),
                          style: taskTextStyle,
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        icon: taskStatusWidget(_taskStatus),
                        onPressed: () => _taskStatus = !_taskStatus,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final taskModel = TaskModel(
              userId: _taskList.length,
              id: _taskList.length + 1,
              title: titleNewTask,
              completed: false);

          _addTask(_taskList, taskModel);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _addTask(List<TaskModel> _taskList, TaskModel taskModel) =>
      controller.addTask(_taskList, taskModel);

  void _getTaskList() => controller.getTaskList();
}
