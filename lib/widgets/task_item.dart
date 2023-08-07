import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';
import 'custom_btn_widget.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.customTextTheme,
  });

  final TextTheme customTextTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 128,
        decoration: BoxDecoration(
          color: AppColors.secondary,
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
                  "Task1",
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
                      "09:33 PM - 09:48 PM",
                      style: customTextTheme.displayMedium,
                    )
                  ],
                ),
                Text(
                  "Learn Dart",
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
                    "TODO",
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
