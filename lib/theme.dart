import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF126090);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
}

final ThemeData appTheme = ThemeData(
  fontFamily: 'Cairo',
  scaffoldBackgroundColor: AppColors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.primary,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      color: AppColors.black,
      fontSize: 14,
    ),
    titleLarge: TextStyle(
      color: AppColors.primary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);
