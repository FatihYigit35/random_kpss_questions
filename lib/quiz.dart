import 'package:flutter/material.dart';
import 'package:random_kpss_questions/app_colors.dart';
import 'package:random_kpss_questions/questions_screen.dart';
import 'package:random_kpss_questions/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget activeScreen = const StartScreen();

  void changeScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body:  activeScreen,
      ),
    );
  }
}