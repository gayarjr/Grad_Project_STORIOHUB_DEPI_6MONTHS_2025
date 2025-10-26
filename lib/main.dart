// lib/main.dart

import 'package:flutter/material.dart';
import 'package:gradprojectstorio/screens/auth/splash_screen.dart';
import 'package:gradprojectstorio/themes/app_colors.dart';
import 'package:gradprojectstorio/themes/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STRIOHUB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
        // Apply custom text styles
        textTheme: TextTheme(
          displayLarge: AppStyles.heading1,
          headlineMedium: AppStyles.heading2,
          bodyLarge: AppStyles.bodyText,
          bodyMedium: AppStyles.bodyText.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        // Apply custom input decoration theme globally
        inputDecorationTheme: AppStyles.inputDecorationTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.primary),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(
              secondary: AppColors
                  .primary, // Using primary for accent in this minimal design
              primary: AppColors.primary,
            ),
      ),
      home: const SplashScreen(),
    );
  }
}
