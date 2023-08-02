import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppStrings.appName,
    );
  }
}