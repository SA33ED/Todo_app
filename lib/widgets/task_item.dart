import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/task_cubit.dart';
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
          color: BlocProvider.of<TaskCubit>(context).colors[taskmodel.color!],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    taskmodel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: customTextTheme.displayLarge!.copyWith(fontSize: 24),
                  ),
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
                SizedBox(
                  width: 250,
                  child: Text(
                    taskmodel.note,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: customTextTheme.displayLarge!.copyWith(fontSize: 24),
                  ),
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
                    taskmodel.status == "TODO"
                        ? CustomBtn(
                            onTap: () {
                              BlocProvider.of<TaskCubit>(context)
                                  .updateTaskStatusToCompeleted(taskmodel.id);
                              Navigator.pop(context);
                            },
                            customTextTheme: customTextTheme,
                            title: "TASK COMPLETED",
                          )
                        : CustomBtn(
                            onTap: () {
                              BlocProvider.of<TaskCubit>(context)
                                  .updateTaskStatusToUnCompeleted(taskmodel.id);
                              Navigator.pop(context);
                            },
                            customTextTheme: customTextTheme,
                            title: "TASK UNCOMPLETED",
                          ),
                    const SizedBox(height: 24),
                    CustomBtn(
                      onTap: () {
                        BlocProvider.of<TaskCubit>(context)
                            .deleteTask(taskmodel.id);
                        Navigator.pop(context);
                      },
                      customTextTheme: customTextTheme,
                      btnColor: AppColors.red,
                      title: "DELETE TASK",
                    ),
                    const SizedBox(height: 24),
                    CustomBtn(
                      onTap: () {
                        Navigator.pop(context);
                      },
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
