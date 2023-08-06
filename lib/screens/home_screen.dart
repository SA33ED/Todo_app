import 'package:flutter/material.dart';
import 'package:to_do_app/helpers/app_colors.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            DateFormat.yMMMMd().format(
              DateTime.now(),
            ),
            style: Theme.of(context).textTheme.displayLarge,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.secondary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
