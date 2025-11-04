import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_text_field_with_label.dart';

class MyDetails extends StatelessWidget {
  const MyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Details'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
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
                      SizedBox(height: 350.h),
                      CustomButton(text: 'Submit', onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



