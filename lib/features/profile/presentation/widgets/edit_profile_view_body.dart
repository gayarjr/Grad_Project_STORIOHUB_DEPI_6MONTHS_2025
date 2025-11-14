import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/functions/validators.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/core/widgets/custom_snack_bar.dart';
import 'package:gradprojectstorio/core/widgets/custom_text_field_with_label.dart';
import 'package:gradprojectstorio/features/profile/data/models/requests/update_me_request.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/update_me_cubit/update_me_cubit.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  late TextEditingController _email, _phone, _name;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _phone = TextEditingController();
    _name = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _phone.dispose();
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                controller: _name,
                validator: Validators.name,
                label: "Full Name",
                hint: "Enter your full name",
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16.h),
              CustomTextFieldWithLabel(
                controller: _email,
                validator: Validators.email,
                keyboardType: TextInputType.emailAddress,
                label: "Email",
                hint: "Enter your email address",
              ),
              SizedBox(height: 16.h),
              CustomTextFieldWithLabel(
                controller: _phone,
                validator: Validators.phone,
                keyboardType: TextInputType.phone,
                label: "Phone",
                hint: "Enter your phone",
              ),
              SizedBox(height: 32.h),
              BlocListener<UpdateMeCubit, UpdateMeState>(
                listener: (context, state) {
                  if (state is UpdateMeLoading) {
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
                  if (state is UpdateMeLoaded) {
                    Navigator.pop(context);
                    customSnackBar(
                      context,
                      message: 'Updated Successfully',
                      type: AnimatedSnackBarType.success,
                    );
                    Navigator.pop(context);
                  }
                  if (state is UpdateMeError) {
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
                    if (_email.text.isNotEmpty ||
                        _phone.text.isNotEmpty ||
                        _name.text.isNotEmpty) {
                      context.read<UpdateMeCubit>().updateMe(
                        request: UpdateMeRequest(
                          name: _name.text,
                          email: _email.text,
                          phone: _phone.text,
                        ),
                      );
                    } else {
                      customSnackBar(
                        context,
                        message: 'Please fill any one field',
                        type: AnimatedSnackBarType.warning,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
