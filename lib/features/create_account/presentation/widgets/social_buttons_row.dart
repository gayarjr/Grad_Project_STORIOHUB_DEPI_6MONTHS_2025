import 'package:flutter/material.dart';
import 'social_button.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Or", style: TextStyle(color: Colors.grey)),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 24),
        SocialButton(
          text: "Sign Up with Google",
          iconPath: 'assets/icons/logos_google-icon.png',
          borderColor: Colors.black,
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        SocialButton(
          text: "Sign Up with Facebook",
          iconPath: 'assets/icons/logos_facebook.png',
          backgroundColor: const Color(0xFF1877F2),
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}
