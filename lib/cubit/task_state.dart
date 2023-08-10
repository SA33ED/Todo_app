sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class GetDateLoadingState extends TaskState {}

final class GetDateSucessState extends TaskState {}

final class GetDateErrorState extends TaskState {}

final class GetSelectedDateLoadingState extends TaskState {}

final class GetSelectedDateSucessState extends TaskState {}

final class GetSelectedDateErrorState extends TaskState {}

final class GetStartTimeLoadingState extends TaskState {}

final class GetStartTimeSucessState extends TaskState {}

final class GetStartTimeErrorState extends TaskState {}

final class GetEndTimeLoadingState extends TaskState {}

final class GetEndTimeSucessState extends TaskState {}

final class GetEndTimeErrorState extends TaskState {}

final class UpdateSelectedColorState extends TaskState {}

final class SelectColorState extends TaskState {}

final class NoTasksState extends TaskState {}

final class ShowTasksState extends TaskState {}

final class AddTaskLoadingState extends TaskState {}

final class AddTaskSucssesState extends TaskState {}

final class AddTaskErrorState extends TaskState {}
