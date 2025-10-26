import 'package:flutter/material.dart';
import 'package:gradprojectstorio/themes/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: keyboardType,
        style: AppStyles.bodyText,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
