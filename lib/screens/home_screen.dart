import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/task_cubit.dart';
import 'package:to_do_app/helpers/app_colors.dart';
import 'package:intl/intl.dart';
import '../cubit/task_state.dart';
import '../widgets/no_task_widget.dart';
import '../widgets/task_item.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  static String id = "HomeScreen";
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextTheme customTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return ListView(
              children: [
                //!Date
                Text(
                  DateFormat.yMMMMd().format(
                    BlocProvider.of<TaskCubit>(context).selectedDate!,
                  ),
                  style: customTextTheme.displayLarge!.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 12),
                //!Today
                //TODo
                Text(
                  "Today",
                  style: customTextTheme.displayLarge!.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 20),
                //!Date Picker
                DatePicker(
                  DateTime.now(),
                  height: 110,
                  width: 60,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColors.secondary,
                  selectedTextColor: Colors.white,
                  deactivatedColor: Colors.white,
                  monthTextStyle: customTextTheme.displayMedium!,
                  dayTextStyle: customTextTheme.displayMedium!,
                  dateTextStyle: customTextTheme.displayMedium!,
                  onDateChange: (date) {
                    BlocProvider.of<TaskCubit>(context).getselectedDate(date);
                  },
                ),
                const SizedBox(height: 32),
                BlocProvider.of<TaskCubit>(context).tasksList.isEmpty
                    ? NoTasksWidgets(customTextTheme: customTextTheme)
                    : Column(
                        children: List.generate(
                          BlocProvider.of<TaskCubit>(context).tasksList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: TaskItem(
                              customTextTheme: customTextTheme,
                              taskmodel: BlocProvider.of<TaskCubit>(context)
                                  .tasksList[index],
                            ),
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddTaskScreen.id);
          // BlocProvider.of<TaskCubit>(context).tasksList.clear();
        },
        backgroundColor: AppColors.secondary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
