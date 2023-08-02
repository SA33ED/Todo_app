import 'package:flutter/material.dart';
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
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        OnBoardingScreen.id: (context) => const OnBoardingScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
