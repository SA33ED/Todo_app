import 'package:flutter/material.dart';
import 'package:to_do_app/helpers/app_colors.dart';
import 'package:to_do_app/screens/home_screen.dart';
import 'package:to_do_app/screens/on_boarding_screen.dart';
import 'package:to_do_app/screens/splash_screen.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.primary),
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        OnBoardingScreen.id: (context) => const OnBoardingScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
