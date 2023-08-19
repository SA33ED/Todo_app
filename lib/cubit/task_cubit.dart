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

  List<TaskModel> tasksList = [
    // TaskModel(
    //   id: 1,
    //   title: "Task One",
    //   note: "Learning Dart",
    //   date: DateTime.now(),
    //   startTime: "09:33 AM",
    //   endTime: "09:45 PM",
    // ),
    // TaskModel(
    //   id: 2,
    //   title: "Task Two",
    //   note: "Learning Flutter",
    //   date: DateFormat.yMd().format(DateTime.now()),
    //   startTime: "10:33 AM",
    //   endTime: "10:45 PM",
    //   status: "Completed",
    //   color: 2,
    // ),
    // TaskModel(
    //   id: 3,
    //   title: "Task One",
    //   note: "Learning Dart",
    //   date: DateTime.now(),
    //   startTime: "09:33 AM",
    //   endTime: "09:45 PM",
    //   color: AppColors.purble,
    // ),
    // TaskModel(
    //   id: 4,
    //   title: "Task Two",
    //   note: "Learning Flutter",
    //   date: DateTime.now(),
    //   startTime: "10:33 AM",
    //   endTime: "10:45 PM",
    //   status: "Completed",
    //   color: AppColors.customYellow,
    // ),
    // TaskModel(
    //   id: 5,
    //   title: "Task One",
    //   note: "Learning Dart",
    //   date: DateTime.now(),
    //   startTime: "09:33 AM",
    //   endTime: "09:45 PM",
    // ),
    // TaskModel(
    //   id: 6,
    //   title: "Task Two",
    //   note: "Learning Flutter",
    //   date: DateTime.now(),
    //   startTime: "10:33 AM",
    //   endTime: "10:45 PM",
    //   status: "Completed",
    //   color: AppColors.green,
    // ),
  ];

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
    emit(GetSelectedDateLoadingState());
    selectedTitleDate = date;
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
        tasksList = value.map((e) => TaskModel.fromJson(e)).toList();
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
}
