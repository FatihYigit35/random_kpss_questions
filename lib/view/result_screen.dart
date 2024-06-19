import 'package:flutter/material.dart';
import 'package:random_kpss_questions/data/questions.dart';
import 'package:random_kpss_questions/theme/app_colors.dart';
import 'package:random_kpss_questions/view/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestartTest});

  final List<String> chosenAnswers;
  final void Function() onRestartTest;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].correctAnswer,
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '$totalQuestions sorudan $correctQuestions soruyu doğru cevapladınız.',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Sorular ve Cevaplar:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 16,
            ),
            FilledButton(
              onPressed: onRestartTest,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  AppColors.primaryColor,
                ),
              ),
              child: const Text('Testi yeniden başlat'),
            )
          ],
        ),
      ),
    );
  }
}
