import 'package:flutter/material.dart';
import 'package:to_do_app/helpers/app_colors.dart';
import 'package:to_do_app/models/on_boarding_model.dart';
import 'package:to_do_app/widgets/custom_on_boarding_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  static String id = "OnBoarding";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: CustomOnBoardingWidget(
        startBtnOnTapFunction: () {},
        dataList: onBoardingList,
        titleColor: Colors.white,
        subtitleColor: Colors.white,
        themeColor: AppColors.secondary,
      ),
    );
  }
}
