import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: 'By signing up you agree to our ',
        style: TextStyle(fontSize: 14, color: Colors.grey),
        children: [
          TextSpan(
            text: 'Terms, Privacy Policy',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          TextSpan(text: ', and '),
          TextSpan(
            text: 'Cookie Use',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
