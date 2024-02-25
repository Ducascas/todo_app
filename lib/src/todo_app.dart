import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_kvant/src/common/config/config.dart';
import 'package:todo_kvant/src/common/utils/constants/app_constants.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appTitle,
      theme: lightTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
