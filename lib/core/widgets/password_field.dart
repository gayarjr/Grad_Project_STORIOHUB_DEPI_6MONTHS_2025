import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/functions/validators.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;

  const PasswordField({
    super.key,
    this.controller,
    required this.hintText,
    required this.labelText,
    this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: AppStyles.textMedium16),
        const SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          obscureText: !_isPasswordVisible,
          validator: widget.validator ?? Validators.password,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
