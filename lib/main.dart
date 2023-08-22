import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/cubit/task_cubit.dart';
import 'package:to_do_app/helpers/app_cashe.dart';
import 'package:to_do_app/helpers/app_colors.dart';
import 'package:to_do_app/helpers/service_locator.dart';
import 'package:to_do_app/helpers/sqflite_helper.dart';
import 'package:to_do_app/screens/add_task_screen.dart';
import 'screens/home_screen.dart';
import 'screens/on_boarding_screen.dart';
import 'screens/splash_screen.dart';

void main() async {
  //Shared Preferencess
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await getIt<AppCashe>().init();
  await getIt<SqfLiteHelper>().initDB();
  runApp(
    //Bloc & Cubit
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskCubit()..getTasks(),
        ),
      ],
      //Runing My App
      child: const ToDoApp(),
    ),
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          theme: getThemeData(),
          debugShowCheckedModeBanner: false,
          routes: {
            SplashScreen.id: (context) => const SplashScreen(),
            OnBoardingScreen.id: (context) => const OnBoardingScreen(),
            HomeScreen.id: (context) => const HomeScreen(),
            AddTaskScreen.id: (context) => const AddTaskScreen(),
          },
          initialRoute: SplashScreen.id,
        );
      },
    );
  }
}

//App Theme
ThemeData getThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.lato(
          color: AppColors.whiteText,
          fontSize: 24,
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
