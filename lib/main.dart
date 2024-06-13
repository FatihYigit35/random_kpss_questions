import 'package:flutter/material.dart';
import 'package:random_kpss_questions/theme/app_colors.dart';
import 'package:random_kpss_questions/view/quiz.dart';

void main() {
  runApp(const Quiz());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: const Quiz(),
      ),
    );
  }
}
