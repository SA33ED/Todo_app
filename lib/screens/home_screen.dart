import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/helpers/app_assets.dart';
import 'package:to_do_app/helpers/app_colors.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    TextTheme customTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: ListView(
          children: [
            //Date
            Text(
              DateFormat.yMMMMd().format(
                selectedDate!,
              ),
              style: customTextTheme.displayLarge!.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 12),
            //Today
            Text(
              "Today",
              style: customTextTheme.displayLarge!.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 20),
            //Date Picker
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
                setState(() {
                  selectedDate = date;
                });
              },
            ),
            const SizedBox(height: 32),
            // NoTasksWidgets(customTextTheme: customTextTheme)
            TaskItem(customTextTheme: customTextTheme),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.secondary,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.customTextTheme,
  });

  final TextTheme customTextTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 128,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Task1",
                style: customTextTheme.displayLarge!
                    .copyWith(fontSize: 24),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.timer_sharp,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "09:33 PM - 09:48 PM",
                    style: customTextTheme.displayMedium,
                  )
                ],
              ),
              Text(
                "Learn Dart",
                style: customTextTheme.displayLarge!
                    .copyWith(fontSize: 24),
              )
            ],
          ),
          Row(
            children: [
              const VerticalDivider(
                indent: 20,
                endIndent: 20,
                color: Colors.white,
                thickness: 1,
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  "TODO",
                  style: customTextTheme.displayMedium,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NoTasksWidgets extends StatelessWidget {
  const NoTasksWidgets({
    super.key,
    required this.customTextTheme,
  });

  final TextTheme customTextTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 19),
        //no tasks image
        SvgPicture.asset(
          Assets.imagesTasks,
          width: 300,
        ),
        //title
        Text(
          "What do you want to do today?",
          style: customTextTheme.displayMedium!.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 10),
        //sub Title
        Text(
          "Tap + to add your tasks",
          style: customTextTheme.displayMedium,
        ),
      ],
    );
  }
}
