import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_kpss_questions/answer_button.dart';
import 'package:random_kpss_questions/app_colors.dart';
import 'package:random_kpss_questions/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void onClickAnswer() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                ...currentQuestion.answers.map(
                  (answer) => AnswerButton(
                    text: answer,
                    onClick: onClickAnswer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
