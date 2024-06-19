import 'package:flutter/material.dart';
import 'package:random_kpss_questions/theme/app_colors.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onClick});

  final String text;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
