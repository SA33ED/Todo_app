import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/cubit/cubit/task_state.dart';

import '../../helpers/app_colors.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
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
}
