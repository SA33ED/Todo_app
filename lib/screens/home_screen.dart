import 'package:flutter/material.dart';
import 'package:to_do_app/helpers/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
    );
  }
}
