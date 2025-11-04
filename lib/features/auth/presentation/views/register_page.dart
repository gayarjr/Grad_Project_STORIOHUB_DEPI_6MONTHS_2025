import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/core/widgets/password_field.dart';

import '../../../../core/functions/validators.dart';
import '../../../../core/widgets/custom_text_field_with_label.dart';
import '../../cubit/register_cubit.dart';
import '../../cubit/register_states.dart';
import '../widgets/not_or_have_account_text.dart';
import '../widgets/terms_text.dart';
import 'login_view.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("✅ Registered Successfully")),
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginView()),
              (route) => false,
            );
          }

          if (state is RegisterErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("❌ ${state.error}")));
          }
        },
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();
          final isLoading = state is RegisterLoadingState;

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          "Create an Account",
                          style: AppStyles.textSemiBold32,
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Let's create your account.",
                          style: AppStyles.textRegular16.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                        const SizedBox(height: 24),
                        CustomTextFieldWithLabel(
                          controller: nameController,
                          label: "Full Name",
                          hint: "Enter your full name",
                          keyboardType: TextInputType.text,
                          validator: Validators.name,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextFieldWithLabel(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: "Email",
                          hint: "Enter your email address",
                          validator: Validators.email,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextFieldWithLabel(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          label: "Phone",
                          hint: "Enter your phone",
                          validator: Validators.phone,
                        ),
                        SizedBox(height: 16.h),
                        PasswordField(
                          controller: passController,
                          labelText: "Password",
                          hintText: 'Enter your password',
                        ),
                        SizedBox(height: 16.h),
                        PasswordField(
                          controller: confirmPassController,
                          labelText: "Confirm Password",
                          hintText: 'Confirm your password',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != passController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12.h),
                        const TermsText(),
                        SizedBox(height: 24.h),
                        isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomButton(
                                text: 'Create an Account',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.userRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passController.text,
                                      rePassword: confirmPassController.text,
                                      phone: phoneController.text,
                                    );
                                  }
                                },
                              ),
                        // SizedBox(height: 24),
                        // const SocialButtonsRow(),
                        const SizedBox(height: 20),
                        NotOrHaveAccountText(
                          text: "Already have an account? ",
                          buttonText: "Log In",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
