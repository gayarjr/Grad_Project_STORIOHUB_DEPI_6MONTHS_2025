import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradprojectstorio/themes/app_colors.dart';
import 'package:gradprojectstorio/themes/app_styles.dart';

class OtpInputField extends StatelessWidget {
  final bool first;
  final bool last;

  const OtpInputField({Key? key, required this.first, required this.last})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextFormField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        style: AppStyles.heading2, // Large, bold text for digits
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          hintText: '•',
          hintStyle: AppStyles.heading2.copyWith(
            color: AppColors.textSecondary,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppStyles.borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppStyles.borderRadius),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          filled: true,
          fillColor: AppColors.inputBackground,
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
