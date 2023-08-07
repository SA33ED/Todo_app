import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/helpers/app_colors.dart';
import 'package:to_do_app/widgets/custom_btn_widget.dart';
import 'package:to_do_app/widgets/custom_input_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  static String id = "AddTaskScreen";

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int selectedColorIndex = 0;
  DateTime? selectedDate = DateTime.now();
  String selectedStartTime = DateFormat('hh:mm a').format(DateTime.now());
  String selectedEndTime = DateFormat('hh:mm a').format(DateTime.now());
  List<Color> colors = [
    AppColors.red,
    AppColors.green,
    AppColors.lightBlue,
    AppColors.blue,
    AppColors.customYellow,
    AppColors.purble,
  ];
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
            size: 32,
          ),
        ),
        title: Text(
          "Add Task",
          style: customTextTheme.displayLarge!.copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        //!Form Started
        child: Form(
          child: Column(children: [
            Expanded(
              child: ListView(
                children: [
                  //ToDo Title
                  CustomTextField(title: "Title", hint: "Enter title here"),
                  SizedBox(height: 24.h),
                  //ToDo Note
                  CustomTextField(title: "Note", hint: "Enter note here"),
                  SizedBox(height: 24.h),
                  //ToDo Date
                  CustomTextField(
                    title: "Date",
                    hint: DateFormat.yMd().format(selectedDate!),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate ?? DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2025),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_month_sharp),
                    ),
                    readOnly: true,
                  ),
                  SizedBox(height: 24.h),

                  //ToDo Start-End Time
                  Row(children: [
                    Expanded(
                        child: CustomTextField(
                      readOnly: true,
                      title: "Start time",
                      hint: selectedStartTime,
                      suffixIcon: IconButton(
                        onPressed: () async {
                          TimeOfDay? pickedStartTime = await showTimePicker(
                              context: context,
                              initialTime:
                                  TimeOfDay.fromDateTime(DateTime.now()));

                          if (pickedStartTime != null) {
                            setState(() {
                              selectedStartTime =
                                  pickedStartTime.format(context);
                            });
                          }
                        },
                        icon: const Icon(Icons.timer_sharp),
                      ),
                    )),
                    SizedBox(width: 26.w),
                    Expanded(
                        child: CustomTextField(
                            readOnly: true,
                            title: "End time",
                            hint: selectedEndTime,
                            suffixIcon: IconButton(
                              onPressed: () async {
                                TimeOfDay? pickedEndTime = await showTimePicker(
                                    context: context,
                                    initialTime:
                                        TimeOfDay.fromDateTime(DateTime.now()));

                                if (pickedEndTime != null) {
                                  setState(() {
                                    selectedEndTime =
                                        pickedEndTime.format(context);
                                  });
                                }
                              },
                              icon: const Icon(Icons.timer_sharp),
                            )))
                  ]),
                  SizedBox(height: 24.h),
                  //ToDo Colors
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text("Color",
                                style: customTextTheme.displayMedium),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: colors.length,
                        separatorBuilder: (_, i) => SizedBox(width: 8.w),
                        itemBuilder: (_, i) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColorIndex = i;
                              });
                            },
                            child: CircleAvatar(
                                backgroundColor: colors[i],
                                child: selectedColorIndex == i
                                    ? const Icon(Icons.check)
                                    : null),
                          );
                        }),
                  ),
                ],
              ),
            ),
            CustomBtn(customTextTheme: customTextTheme, title: "Create Task")
          ]),
        ),
        //!Form Ended
      ),
    );
  }
}
