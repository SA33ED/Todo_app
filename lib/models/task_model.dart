import 'package:flutter/material.dart';
import 'package:to_do_app/helpers/app_colors.dart';

class TaskModel {
  int id;
  String title;
  String note;
  DateTime date;
  String startTime;
  String endTime;
  String? status;
  Color? color;
  TaskModel({
    required this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.color = AppColors.red,
    this.status = "TODO",
  }); 
}
