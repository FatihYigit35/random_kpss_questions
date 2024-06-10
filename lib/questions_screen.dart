import 'package:flutter/material.dart';
import 'package:random_kpss_questions/answer_button.dart';
import 'package:random_kpss_questions/app_colors.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Questions Screen"),
              SizedBox(
                height: 30,
              ),
              AnswerButton(
                'Cevap1',
              ),
              AnswerButton(
                'Cevap2',
              ),
              AnswerButton(
                'Cevap3',
              ),
              AnswerButton(
                'Cevap4',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
