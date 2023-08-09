import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/helpers/app_assets.dart';
import 'package:to_do_app/helpers/app_cashe.dart';
import 'package:to_do_app/helpers/app_strings.dart';
import 'package:to_do_app/screens/home_screen.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool isVisited =
        AppCashe().getData(key: AppStrings.sharedPreOnBoarding) ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => isVisited == true
                  ? const HomeScreen()
                  : const OnBoardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.imagesAppLogo),
            const SizedBox(height: 30),
            Text(AppStrings.appName,
                style: Theme.of(context).textTheme.bodyLarge!),
          ],
        ),
      ),
    );
  }
}
