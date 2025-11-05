import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/features/auth/presentation/widgets/pin_section.dart';

class OtpView extends StatefulWidget {
  final String email;
  const OtpView({super.key, required this.email});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Verification', style: AppStyles.textSemiBold32),
              SizedBox(height: 8.h),
              Text(
                "Enter a 4 digit code that you receive on your email (${widget.email})",
                style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
              ),
              SizedBox(height: 24.h),
              PinSection(onCompleted: (code) => log(code)),
              SizedBox(height: 32.h),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.push(AppRoutes.resetPassword, extra: widget.email);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
