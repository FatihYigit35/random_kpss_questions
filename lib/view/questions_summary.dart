import 'package:flutter/material.dart';
import 'package:random_kpss_questions/model/summary_data.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<SummaryData> summaryData;

  @override
  Widget build(BuildContext context) {
    Color getColorQuestion(bool value) {
      if (value) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    }

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((data) => Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: getColorQuestion(
                                  data.correctAnswer == data.userAnswer),
                            ),
                            width: 30,
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              ((data.index) + 1).toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.question,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('Doğru cevap: \n${data.correctAnswer}'),
                                Text(
                                  'Cevabınız: \n${data.userAnswer}',
                                  style: TextStyle(
                                    color: getColorQuestion(
                                        data.correctAnswer == data.userAnswer),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
