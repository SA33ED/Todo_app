import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/cubit/cubit/task_state.dart';

import '../../helpers/app_colors.dart';
import '../../models/task_model.dart';

class TaskCubit extends Cubit<TaskState> {
  GlobalKey<FormState> formKey = GlobalKey();

  TaskCubit() : super(TaskInitial());

  String? selectedTitle;

  String? selectedNote;

  DateTime? selectedDate = DateTime.now();

  String selectedStartTime = DateFormat('hh:mm a').format(DateTime.now());

  String selectedEndTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(hours: 1)));

  int selectedColorIndex = 0;

  List<Color> colors = [
    AppColors.red,
    AppColors.green,
    AppColors.lightBlue,
    AppColors.blue,
    AppColors.customYellow,
    AppColors.purble,
  ];

  List<TaskModel> tasksList = [
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
      status: "Completed",
      color: AppColors.lightBlue,
    ),
    TaskModel(
        id: 3,
        title: "Task One",
        note: "Learning Dart",
        date: DateTime.now(),
        startTime: "09:33 AM",
        endTime: "09:45 PM",
        color: AppColors.purble),
    TaskModel(
        id: 4,
        title: "Task Two",
        note: "Learning Flutter",
        date: DateTime.now(),
        startTime: "10:33 AM",
        endTime: "10:45 PM",
        status: "Completed",
        color: AppColors.customYellow),
    TaskModel(
      id: 5,
      title: "Task One",
      note: "Learning Dart",
      date: DateTime.now(),
      startTime: "09:33 AM",
      endTime: "09:45 PM",
    ),
    TaskModel(
      id: 6,
      title: "Task Two",
      note: "Learning Flutter",
      date: DateTime.now(),
      startTime: "10:33 AM",
      endTime: "10:45 PM",
      status: "Completed",
      color: AppColors.green,
    ),
  ];

  void getDate(context) async {
    emit(GetDateLoadingState());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      selectedDate = pickedDate;
      emit(GetDateSucessState());
    }
  }

  void getselectedDate(date) {
    emit(GetSelectedDateLoadingState());
    selectedDate = date;
    emit(GetSelectedDateSucessState());
  }

  void getStartTime(context) async {
    emit(GetStartTimeLoadingState());
    TimeOfDay? pickedStartTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));

    if (pickedStartTime != null) {
      emit(GetStartTimeSucessState());
      BlocProvider.of<TaskCubit>(context).selectedStartTime =
          pickedStartTime.format(context);
    }
  }

  void getEndTime(context) async {
    emit(GetEndTimeLoadingState());
    TimeOfDay? pickedEndTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));

    if (pickedEndTime != null) {
      emit(GetEndTimeSucessState());
      BlocProvider.of<TaskCubit>(context).selectedEndTime =
          pickedEndTime.format(context);
    }
  }

  void updateSelectedColor(index) {
    selectedColorIndex = index;
    emit(UpdateSelectedColorState());
  }

  void addTask(TaskModel task) {
    try {
      emit(AddTaskLoadingState());
      tasksList.add(task);
      emit(AddTaskSucssesState());
    } catch (e) {
      emit(AddTaskErrorState());
    }
  }
}
