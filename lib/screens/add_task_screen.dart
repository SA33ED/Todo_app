import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/helpers/app_colors.dart';
import 'package:to_do_app/widgets/custom_input_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  static String id = "AddTaskScreen";

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime? selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TextTheme customTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 45,
          ),
        ),
        title: Text(
          "Add Task",
          style: customTextTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          child: ListView(
            children: [
              CustomTextField(title: "Title", hint: "Enter title here"),
              const SizedBox(height: 20),
              CustomTextField(title: "Note", hint: "Enter note here"),
              const SizedBox(height: 20),
              CustomTextField(
                title: "Date",
                hint: DateFormat.yMd().format(selectedDate!),
                suffixIcon: IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate!,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2025),
                    );
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  },
                  icon: const Icon(Icons.calendar_month_sharp),
                ),
                readOnly: true,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
