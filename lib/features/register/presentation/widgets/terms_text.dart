import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'By signing up you agree to our ',
        style: AppStyles.textRegular14,
        children: [
          TextSpan(
            text: 'Terms, Privacy Policy',
            style: AppStyles.textMedium14.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(text: ', and ', style: AppStyles.textRegular14),
          TextSpan(
            text: 'Cookie Use',
            style: AppStyles.textMedium14.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
