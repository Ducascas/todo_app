import 'package:get/get.dart';
import 'package:todo_kvant/src/features/presentation/presentation.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.TASK_LIST;

  static final routes = [
    GetPage(
      name: _Paths.Task_List,
      page: () => TaskListScreen(taskList: []),
    ),
    // GetPage(
    //   name: _Paths.Task_Edit,
    //   page: () =>  TaskEditScreen(taskList: [],),
    // )
  ];
}
