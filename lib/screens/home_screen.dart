import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/helpers/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/screens/add_task_screen.dart';
import '../widgets/task_item.dart';

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
            // NoTasksWidgets(customTextTheme: customTextTheme),
            TaskItem(customTextTheme: customTextTheme),
          ],
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
