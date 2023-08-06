import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/app_assets.dart';

class NoTasksWidgets extends StatelessWidget {
  const NoTasksWidgets({
    super.key,
    required this.customTextTheme,
  });

  final TextTheme customTextTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 19),
        //no tasks image
        SvgPicture.asset(
          Assets.imagesTasks,
          width: 300,
        ),
        //title
        Text(
          "What do you want to do today?",
          style: customTextTheme.displayMedium!.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 10),
        //sub Title
        Text(
          "Tap + to add your tasks",
          style: customTextTheme.displayMedium,
        ),
      ],
    );
  }
}
