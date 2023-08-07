// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';

class CustomBtn extends StatelessWidget {
  CustomBtn({
    super.key,
    required this.customTextTheme,
    required this.title,
    this.btnColor = AppColors.secondary,
  });

  final TextTheme customTextTheme;
  Color? btnColor = AppColors.secondary;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: btnColor,
        ),
        child: Text(
          title,
          style: customTextTheme.displayMedium,
        ),
      ),
    );
  }
}
