import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/task_cubit.dart';
import 'package:to_do_app/cubit/task_state.dart';
import 'package:to_do_app/widgets/no_task_widget.dart';
import 'package:to_do_app/widgets/task_item.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});
  static String id = "AllTasksScreen";
  @override
  Widget build(BuildContext context) {
    TextTheme customTextTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: BlocConsumer<TaskCubit, TaskState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView(
            children: [
              BlocProvider.of<TaskCubit>(context).alltasksList.isEmpty
                  ? NoTasksWidgets(customTextTheme: customTextTheme)
                  : Column(
                      children: List.generate(
                        BlocProvider.of<TaskCubit>(context).alltasksList.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: TaskItem(
                            customTextTheme: customTextTheme,
                            taskmodel: BlocProvider.of<TaskCubit>(context)
                                .alltasksList[index],
                          ),
                        ),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
