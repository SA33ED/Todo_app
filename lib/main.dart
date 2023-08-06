import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/helpers/app_cashe.dart';
import 'package:to_do_app/helpers/app_colors.dart';

import 'screens/home_screen.dart';
import 'screens/on_boarding_screen.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCashe.init();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
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

ThemeData getThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.lato(
          color: AppColors.whiteText,
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
        displayLarge: GoogleFonts.lato(
          color: AppColors.whiteText.withOpacity(0.8700000047683716),
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: GoogleFonts.lato(
          color: AppColors.whiteText.withOpacity(0.8700000047683716),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: GoogleFonts.lato(
          color: AppColors.whiteText.withOpacity(0.4399999976158142),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        )),
  );
}
