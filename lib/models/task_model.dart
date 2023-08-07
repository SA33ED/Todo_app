import 'package:flutter/material.dart';
import 'package:to_do_app/helpers/app_colors.dart';

class TaskModel {
  TaskModel({
    required int id,
    required String title,
    required String note,
    required DateTime date,
    required String startTime,
    required String endTime,
    String? status = "TODO",
    Color? color = AppColors.red,
  });
}

List<TaskModel> tasks = [
  TaskModel(
    id: 1,
    title: "Task One",
    note: "Learning Dart",
    date: DateTime.now(),
    startTime: "09:33 AM",
    endTime: "09:45 PM",
  ),
  TaskModel(
    id: 2,
    title: "Task Two",
    note: "Learning Flutter",
    date: DateTime.now(),
    startTime: "10:33 AM",
    endTime: "10:45 PM",
  ),
];
