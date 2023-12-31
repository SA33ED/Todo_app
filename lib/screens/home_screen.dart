import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/task_cubit.dart';
import 'package:to_do_app/helpers/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/screens/all_tasks_screen.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(
                        BlocProvider.of<TaskCubit>(context).selectedTitleDate!,
                      ),
                      style:
                          customTextTheme.displayLarge!.copyWith(fontSize: 24),
                    ),
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<TaskCubit>(context).getAllTasks();
                          Navigator.pushNamed(context, AllTasksScreen.id);
                        },
                        icon: const Icon(Icons.menu))
                  ],
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
                  DateTime.now().subtract(const Duration(days: 2)),
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
                    BlocProvider.of<TaskCubit>(context)
                        .getselectedTitleDate(date);
                  },
                ),
                const SizedBox(height: 32),

                //!Tasks
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
        },
        backgroundColor: AppColors.secondary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
