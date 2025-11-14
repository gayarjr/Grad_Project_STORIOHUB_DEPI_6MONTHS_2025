import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/core/widgets/custom_text_field_with_label.dart';

class MyDetails extends StatelessWidget {
  const MyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Details', style: AppStyles.textSemiBold24),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(height: 1, color: Colors.grey[300]),
            ),
            Column(
              children: [
                SizedBox(height: 24.h),
                CustomTextFieldWithLabel(
                  label: "Full Name",
                  hint: "Enter your full name",
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 16.h),
                CustomTextFieldWithLabel(
                  keyboardType: TextInputType.emailAddress,
                  label: "Email",
                  hint: "Enter your email address",
                ),
                SizedBox(height: 16.h),
                CustomTextFieldWithLabel(
                  keyboardType: TextInputType.phone,
                  label: "Phone",
                  hint: "Enter your phone",
                ),
                SizedBox(height: 32.h),
                CustomButton(text: 'Submit', onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
