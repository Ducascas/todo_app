import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_kvant/src/common/common.dart';
import 'package:todo_kvant/src/features/data/data.dart';
import 'package:todo_kvant/src/features/presentation/presentation.dart';

class TaskEditScreen extends StatefulWidget {
  TaskEditScreen(
      {super.key,
      required this.taskList,
      required this.taskModel,
      required this.index});

  List<TaskModel> taskList;
  TaskModel taskModel;
  int index;

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {

  final TaskController controller = getIt<TaskController>();
  late final TextEditingController _textEditingController;

  late List<TaskModel> _taskList;
  late TaskModel _task;
  late final _taskUserId;
  late int? _taskId;
  late String? _taskTitle;
  late bool _taskStatus;

  late int _index;

  @override
  void initState() {
    _index = widget.index ?? 0;
    _taskList = widget.taskList;
    _task = widget.taskModel;

    _taskUserId = _task.userId;
    _taskId = _task.id;
    _taskTitle = _task.title?.toCapitalized();
    _taskStatus = _task.completed ?? false;
    controller.taskStatus.value = _taskStatus;

    _textEditingController = controller.textEditingController
      ..text = _taskTitle ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          editTitle,
          style: taskTextStyle,
        ),
      ),
      body: SizedBox(
        height: 350,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: tdWhite,
          elevation: 14,
          margin: const EdgeInsets.all(10),
          child: Form(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
              children: [
                _textTaskId(),
                const SizedBox(height: 10),
                _textField(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(titleEditStatus, style: taskTextStyle),
                    _taskStatusButton(),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: _editTask,
                  child: const Text(titleEdit, style: taskTextStyle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _textTaskId() => Text('$titleEditTask$_taskId', style: taskTextStyle);

  Obx _taskStatusButton() {
    return Obx(
      () => IconButton(
        icon: taskStatusWidget(controller.taskStatus.value),
        onPressed: _changeStatus,
      ),
    );
  }

  void _changeStatus() {
    controller.taskStatus.value = !controller.taskStatus.value;
    _taskStatus = controller.taskStatus.value;
  }

  void _editTask() {
    final taskTitle = _textEditingController.text;

    _task = TaskModel(
        userId: _taskUserId,
        id: _taskId,
        title: taskTitle,
        completed: _taskStatus);

    controller.editTask(_taskList, _task, _index);

    Get.to(TaskListScreen(taskList: _taskList));
  }

  TextFormField _textField() {
    return TextFormField(
      controller: _textEditingController,
      decoration: const InputDecoration(border: OutlineInputBorder()),
      style: taskTextStyle,
      onChanged: (value) => _taskTitle = value,
    );
  }
}
