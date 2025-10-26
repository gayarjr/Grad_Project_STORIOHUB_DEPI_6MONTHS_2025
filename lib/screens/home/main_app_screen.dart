// lib/screens/home/main_app_screen.dart

import 'package:flutter/material.dart';
import 'package:gradprojectstorio/themes/app_colors.dart';
import 'package:gradprojectstorio/themes/app_styles.dart';

class MainAppScreen extends StatelessWidget {
  const MainAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(color: AppColors.primary),
        ),
        automaticallyImplyLeading: false, // Prevents back button after login
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the STORIOHUB!', style: AppStyles.heading1),
            const SizedBox(height: 20),
            Text(
              'You have successfully completed the authentication flow.',
              style: AppStyles.bodyText.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
