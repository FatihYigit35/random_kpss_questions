import 'package:flutter/material.dart';
import 'package:random_kpss_questions/app_colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/kpss_logo_1.jpeg"),
          Text(
            'Rastgele sorular ile\nKPSS bilgini test etmek istiyor musun?',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 55),
          FilledButton(
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(const Size(200, 45)),
              backgroundColor: WidgetStateProperty.all<Color>(
                AppColors.primaryColor,
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Testi başlat',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
