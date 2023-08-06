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
            NoTasksWidgets(customTextTheme: customTextTheme)
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
