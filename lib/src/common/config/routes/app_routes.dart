part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const TASK_LIST = _Paths.Task_List;
  static const TASK_EDIT = _Paths.Task_Edit;
}

abstract class _Paths {
  static const Task_List = '/task_list';
  static const Task_Edit = '/task_edit';
}