import 'package:flutter/material.dart';
import 'package:random_kpss_questions/theme/app_colors.dart';
import 'package:random_kpss_questions/data/questions.dart';
import 'package:random_kpss_questions/view/questions_screen.dart';
import 'package:random_kpss_questions/view/result_screen.dart';
import 'package:random_kpss_questions/view/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start_screen';
  List<String> selectedAnswers = [];

  void changeScreen() {
    selectedAnswers = [];

    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  void addAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(changeScreen);

    if (activeScreen == 'questions_screen') {
      screen = QuestionsScreen(
        onSelectedAnswer: addAnswer,
      );
    }

    if (activeScreen == 'results_screen') {
      screen = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestartTest: changeScreen,
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: screen,
        ),
      ),
    );
  }
}
