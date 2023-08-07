import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';

import '../helpers/app_colors.dart';
import 'custom_btn_widget.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.customTextTheme,
    required this.taskmodel,
  });

  final TextTheme customTextTheme;
  final TaskModel taskmodel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 128,
        decoration: BoxDecoration(
          color: taskmodel.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskmodel.title,
                  style: customTextTheme.displayLarge!.copyWith(fontSize: 24),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.timer_sharp,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${taskmodel.startTime} PM - ${taskmodel.endTime} PM",
                      style: customTextTheme.displayMedium,
                    )
                  ],
                ),
                Text(
                  taskmodel.note,
                  style: customTextTheme.displayLarge!.copyWith(fontSize: 24),
                )
              ],
            ),
            Row(
              children: [
                const VerticalDivider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.white,
                  thickness: 1,
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    taskmodel.status!,
                    style: customTextTheme.displayMedium,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                height: 270,
                color: AppColors.background1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomBtn(
                      customTextTheme: customTextTheme,
                      title: "TASK COMPLETED",
                    ),
                    const SizedBox(height: 24),
                    CustomBtn(
                      customTextTheme: customTextTheme,
                      btnColor: AppColors.red,
                      title: "DELETE TASK",
                    ),
                    const SizedBox(height: 24),
                    CustomBtn(
                      customTextTheme: customTextTheme,
                      title: "CANCEL",
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
