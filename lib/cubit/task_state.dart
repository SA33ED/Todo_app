sealed class TaskState {}

final class TaskInitial extends TaskState {}
//---------------------Date Started------------------

final class GetDateLoadingState extends TaskState {}

final class GetDateSucessState extends TaskState {}

final class GetDateErrorState extends TaskState {}

final class GetSelectedDateLoadingState extends TaskState {}

final class GetSelectedDateSucessState extends TaskState {}

final class GetSelectedDateErrorState extends TaskState {}

//---------------------Date Ended------------------

//---------------------Time Started------------------

final class GetStartTimeLoadingState extends TaskState {}

final class GetStartTimeSucessState extends TaskState {}

final class GetStartTimeErrorState extends TaskState {}

final class GetEndTimeLoadingState extends TaskState {}

final class GetEndTimeSucessState extends TaskState {}

final class GetEndTimeErrorState extends TaskState {}

//---------------------Time Ended------------------

//---------------------Color Started------------------

final class UpdateSelectedColorState extends TaskState {}

final class SelectColorState extends TaskState {}
//---------------------Color Ended------------------

//---------------------Tasks Started------------------
//!No Tasks State
final class NoTasksState extends TaskState {}

final class ShowTasksState extends TaskState {}

//!Add Tasks States
final class AddTaskLoadingState extends TaskState {}

final class AddTaskSucssesState extends TaskState {}

final class AddTaskErrorState extends TaskState {}

//!Get Tasks States
final class GetAllTasksLoadingState extends TaskState {}

final class GetAllTasksSucssesState extends TaskState {}

final class GetAllTasksErrorState extends TaskState {}

//! Delete All Tasks States
final class DeleteAllTasksLoadingState extends TaskState {}

final class DeleteAllTasksSucssesState extends TaskState {}

final class DeleteAllTasksErrorState extends TaskState {}

//! Delete All Tasks States
final class DeleteTaskLoadingState extends TaskState {}

final class DeleteTaskSucssesState extends TaskState {}

final class DeleteTaskErrorState extends TaskState {}

//! Update Task States
final class UpdateTaskLoadingState extends TaskState {}

final class UpdateTaskSucssesState extends TaskState {}

final class UpdateTaskErrorState extends TaskState {}
