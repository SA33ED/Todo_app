import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/helpers/app_assets.dart';
import 'package:to_do_app/helpers/app_colors.dart';
import 'package:to_do_app/helpers/app_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String id = "SplashScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.imagesAppLogo),
            const SizedBox(height: 30),
            const Text(
              AppStrings.appName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
