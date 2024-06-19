import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

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
                              color: getColorQuestion(data['correct_answer'] ==
                                  data['user_answer']),
                            ),
                            width: 30,
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              ((data['question_index'] as int) + 1).toString(),
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
                                  data['question'] as String,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                    'Doğru cevap: \n${data['correct_answer'] as String}'),
                                Text(
                                  'Cevabınız: \n${data['user_answer'] as String}',
                                  style: TextStyle(
                                    color: getColorQuestion(
                                        data['correct_answer'] ==
                                            data['user_answer']),
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
