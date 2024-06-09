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
  var activeScreen = 'start_screen';

  void changeScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(changeScreen);

    if (activeScreen == 'questions_screen') {
      screen = const QuestionsScreen();
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: screen,
      ),
    );
  }
}
