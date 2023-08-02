import 'package:flutter/material.dart';
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
      },
      initialRoute: SplashScreen.id,
    );
  }
}
