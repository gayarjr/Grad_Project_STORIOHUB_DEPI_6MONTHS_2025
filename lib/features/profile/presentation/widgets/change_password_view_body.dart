import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/functions/validators.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/core/widgets/custom_snack_bar.dart';
import 'package:gradprojectstorio/core/widgets/password_field.dart';
import 'package:gradprojectstorio/features/profile/data/models/requests/change_password_request.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/change_password_cubit/change_password_cubit.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController _currentPass, _pass, _confirmPass;

  @override
  void initState() {
    super.initState();
    _currentPass = TextEditingController();
    _pass = TextEditingController();
    _confirmPass = TextEditingController();
  }

  @override
  void dispose() {
    _currentPass.dispose();
    _pass.dispose();
    _confirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(height: 1, color: Colors.grey[300]),
            ),
            SizedBox(height: 24.h),
            PasswordField(
              controller: _currentPass,
              validator: Validators.password,
              labelText: "Current Password",
              hintText: 'Enter your current password',
            ),
            SizedBox(height: 16.h),
            PasswordField(
              controller: _pass,
              validator: Validators.password,
              labelText: "New Password",
              hintText: 'Enter your new password',
            ),
            SizedBox(height: 16.h),
            PasswordField(
              controller: _confirmPass,
              validator: (value) {
                if (_pass.text != value) {
                  return 'Passwords do not match';
                }
                return null;
              },
              labelText: "Confirm New Password",
              hintText: 'Re-enter your new password',
            ),
            SizedBox(height: 32.h),
            BlocListener<ChangePasswordCubit, ChangePasswordState>(
              listener: (context, state) {
                if (state is ChangePasswordLoading) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  );
                }
                if (state is ChangePasswordLoaded) {
                  Navigator.pop(context);
                  customSnackBar(
                    context,
                    message: 'Password Changed',
                    type: AnimatedSnackBarType.success,
                  );
                  Navigator.pop(context);
                }
                if (state is ChangePasswordError) {
                  Navigator.pop(context);
                  customSnackBar(
                    context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                }
              },
              child: CustomButton(
                text: 'Submit',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<ChangePasswordCubit>().changePassword(
                      request: ChangePasswordRequest(
                        currentPassword: _currentPass.text,
                        password: _pass.text,
                        rePassword: _confirmPass.text,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
