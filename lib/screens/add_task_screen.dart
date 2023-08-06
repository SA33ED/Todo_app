import 'package:flutter/material.dart';
import 'package:to_do_app/helpers/app_colors.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});
  static String id = "AddTaskScreen";
  @override
  Widget build(BuildContext context) {
    TextTheme customTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 45,
          ),
        ),
        title: Text(
          "Add Task",
          style: customTextTheme.displayLarge,
        ),
      ),
    );
  }
}
