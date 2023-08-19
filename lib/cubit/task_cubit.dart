import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/cubit/task_state.dart';
import 'package:to_do_app/helpers/service_locator.dart';
import '../helpers/app_colors.dart';
import '../helpers/sqflite_helper.dart';
import '../models/task_model.dart';

class TaskCubit extends Cubit<TaskState> {
  GlobalKey<FormState> formKey = GlobalKey();

  TaskCubit() : super(TaskInitial());
//!New Task Data Started
  String? selectedTitle;

  String? selectedNote;

  DateTime? selectedDate = DateTime.now();

  String selectedStartTime = DateFormat('hh:mm a').format(DateTime.now());

  String selectedEndTime = DateFormat('hh:mm a').format(
    DateTime.now().add(
      const Duration(hours: 1),
    ),
  );

  int selectedColorIndex = 0;
//!New Task Data Ended
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();
  DateTime? selectedTitleDate = DateTime.now();

  List<Color> colors = [
    AppColors.red,
    AppColors.green,
    AppColors.lightBlue,
    AppColors.blue,
    AppColors.customYellow,
    AppColors.purble,
  ];

  List<TaskModel> tasksList = [];

  void getDate(context) async {
    emit(GetDateLoadingState());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedTitleDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      selectedDate = pickedDate;
      emit(GetDateSucessState());
    }
  }

  void getselectedTitleDate(date) {
    emit(GetSelectedTitleDateLoadingState());
    try {
      selectedTitleDate = date;
      getTasks();
      emit(GetSelectedTitleDateSucessState());
    } catch (e) {
      emit(GetSelectedTitleDateErrorState());
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

  void addTask() async {
    emit(AddTaskLoadingState());
    try {
      await getIt<SqfLiteHelper>().insertToDB(TaskModel(
        title: selectedTitle ?? "Untitled",
        note: selectedNote ?? "Empty",
        date: DateFormat.yMd().format(selectedDate!),
        startTime: selectedStartTime,
        endTime: selectedEndTime,
        color: selectedColorIndex,
      ));
      getTasks();
      titleController.clear();
      noteController.clear();
      selectedTitle = "Untitled";
      selectedNote = "Empty";
    } catch (e) {
      emit(AddTaskErrorState());
    }
  }

  void getTasks() async {
    emit(GetAllTasksLoadingState());
    try {
      await getIt<SqfLiteHelper>().getFromDB().then((value) {
        tasksList = value
            .map((e) => TaskModel.fromJson(e))
            .toList()
            .where((element) =>
                element.date == DateFormat.yMd().format(selectedTitleDate!))
            .toList();
      });
      emit(GetAllTasksSucssesState());
    } catch (e) {
      emit(GetAllTasksErrorState());
    }
  }

  void updateTaskStatusToCompeleted(id) async {
    emit(UpdateTaskLoadingState());
    try {
      await getIt<SqfLiteHelper>().updateTaskStatusToCompeletedDB(id);
      getTasks();
      emit(UpdateTaskSucssesState());
    } catch (e) {
      emit(UpdateTaskErrorState());
    }
  }

  void updateTaskStatusToUnCompeleted(id) async {
    emit(UpdateTaskLoadingState());
    try {
      await getIt<SqfLiteHelper>().updateTaskStatusToUnCompeleted(id);
      getTasks();
      emit(UpdateTaskSucssesState());
    } catch (e) {
      emit(UpdateTaskErrorState());
    }
  }

  void deleteAllTasks() {
    emit(DeleteAllTasksLoadingState());
    try {
      tasksList.clear();
      emit(DeleteAllTasksSucssesState());
    } catch (e) {
      emit(DeleteAllTasksErrorState());
    }
  }

  void deleteTask(id) async {
    emit(DeleteTaskLoadingState());
    try {
      await getIt<SqfLiteHelper>().deleteTaskFormDB(id);
      getTasks();
      emit(DeleteTaskSucssesState());
    } catch (e) {
      emit(DeleteTaskErrorState());
    }
  }
}
