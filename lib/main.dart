import 'package:flutter/material.dart';
import 'src/features/presentation/presentation.dart';
import 'src/todo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const ToDoApp());
}

