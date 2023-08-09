// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/cubit/cubit/task_cubit.dart';
import 'package:to_do_app/helpers/app_colors.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/custom_btn_widget.dart';
import 'package:to_do_app/widgets/custom_input_field.dart';
import '../cubit/cubit/task_state.dart';

class AddTaskScreen extends StatelessWidget {
  static String id = "AddTaskScreen";

  const AddTaskScreen({super.key});

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
            size: 32,
          ),
        ),
        title: Text(
          "Add Task",
          style: customTextTheme.displayLarge!.copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        //!Form Started
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<TaskCubit>(context).formKey,
              child: Column(children: [
                Expanded(
                  child: ListView(
                    children: [
                      //ToDo Title
                      CustomTextField(
                        title: "Title",
                        hint: "Enter title here",
                        onChanged: (data) => BlocProvider.of<TaskCubit>(context)
                            .selectedTitle = data,
                      ),
                      SizedBox(height: 24.h),
                      //ToDo Note
                      CustomTextField(
                        title: "Note",
                        hint: "Enter note here",
                        onChanged: (data) => BlocProvider.of<TaskCubit>(context)
                            .selectedNote = data,
                      ),
                      SizedBox(height: 24.h),
                      //ToDo Date
                      CustomTextField(
                        title: "Date",
                        hint: DateFormat.yMd().format(
                            BlocProvider.of<TaskCubit>(context).selectedDate!),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            BlocProvider.of<TaskCubit>(context)
                                .getDate(context);
                          },
                          icon: const Icon(Icons.calendar_month_sharp),
                        ),
                        readOnly: true,
                      ),
                      SizedBox(height: 24.h),

                      //ToDo Start-End Time
                      Row(children: [
                        Expanded(
                            child: CustomTextField(
                          readOnly: true,
                          title: "Start time",
                          hint: BlocProvider.of<TaskCubit>(context)
                              .selectedStartTime,
                          suffixIcon: IconButton(
                            onPressed: () async {
                              BlocProvider.of<TaskCubit>(context)
                                  .getStartTime(context);
                            },
                            icon: const Icon(Icons.timer_sharp),
                          ),
                        )),
                        SizedBox(width: 26.w),
                        Expanded(
                            child: CustomTextField(
                                readOnly: true,
                                title: "End time",
                                hint: BlocProvider.of<TaskCubit>(context)
                                    .selectedEndTime,
                                suffixIcon: IconButton(
                                  onPressed: () async {
                                    BlocProvider.of<TaskCubit>(context)
                                        .getEndTime(context);
                                  },
                                  icon: const Icon(Icons.timer_sharp),
                                )))
                      ]),
                      SizedBox(height: 24.h),
                      //ToDo Colors
                      Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text("Color",
                                        style: customTextTheme.displayMedium),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50.h,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: BlocProvider.of<TaskCubit>(context)
                                    .colors
                                    .length,
                                separatorBuilder: (_, index) =>
                                    SizedBox(width: 8.w),
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<TaskCubit>(context)
                                          .updateSelectedColor(index);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor:
                                          BlocProvider.of<TaskCubit>(context)
                                              .colors[index],
                                      child: BlocProvider.of<TaskCubit>(context)
                                                  .selectedColorIndex ==
                                              index
                                          ? const Icon(Icons.check)
                                          : null,
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //ToDo Create Task
                CustomBtn(
                  customTextTheme: customTextTheme,
                  title: "Create Task",
                  onTap: () {
                    BlocProvider.of<TaskCubit>(context).addTask(
                      TaskModel(
                        id: 5,
                        title:
                            BlocProvider.of<TaskCubit>(context).selectedTitle ??
                                "Untitled",
                        note:
                            BlocProvider.of<TaskCubit>(context).selectedNote ??
                                "Empty",
                        date: BlocProvider.of<TaskCubit>(context).selectedDate!,
                        startTime: BlocProvider.of<TaskCubit>(context)
                            .selectedStartTime,
                        endTime:
                            BlocProvider.of<TaskCubit>(context).selectedEndTime,
                        color: BlocProvider.of<TaskCubit>(context).colors[
                            BlocProvider.of<TaskCubit>(context)
                                .selectedColorIndex],
                      ),
                    );
                    Navigator.pop(context);
                  },
                )
              ]),
            );
          },
        ),
        //!Form Ended
      ),
    );
  }
}
