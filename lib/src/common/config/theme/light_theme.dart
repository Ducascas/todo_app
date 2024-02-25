import 'package:flutter/material.dart';
import 'package:todo_kvant/src/common/utils/utils.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: tdGrey,
  appBarTheme: const AppBarTheme(
    color: tdBlue,
    titleTextStyle: taskTextStyle,
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: tdBlue),
  useMaterial3: true,
);
