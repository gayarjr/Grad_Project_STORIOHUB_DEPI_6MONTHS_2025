// lib/widgets/common/primary_button.dart (UPDATED CODE)

import 'package:flutter/material.dart';
import 'package:gradprojectstorio/themes/app_colors.dart';
import 'package:gradprojectstorio/themes/app_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutline;
  final bool isSecondary;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isOutline = false,
    this.isSecondary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isOutline
        ? AppColors.background
        : (isSecondary ? AppColors.inputBackground : AppColors.primary);

    Color textColor = isOutline ? AppColors.textPrimary : AppColors.background;

    if (isSecondary) {
      textColor = AppColors.textPrimary;
    }

    return SizedBox(
      width: double.infinity,
      height: AppStyles.fieldHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyles.borderRadius),
            side: BorderSide(
              color: isOutline ? AppColors.inputBorder : AppColors.primary,
              width: 1.5,
            ),
          ),
        ),
        child: Text(
          text,
          style: AppStyles.buttonText.copyWith(color: textColor),
        ),
      ),
    );
  }
}
