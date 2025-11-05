import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/functions/validators.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/services/shared_preferences_service.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/core/widgets/custom_snack_bar.dart';
import 'package:gradprojectstorio/core/widgets/custom_text_field_with_label.dart';
import 'package:gradprojectstorio/core/widgets/password_field.dart';
import 'package:gradprojectstorio/features/auth/presentation/widgets/not_or_have_account_text.dart';
import 'package:gradprojectstorio/features/auth/presentation/widgets/social_buttons_row.dart';
import '../../cubit/login_cubit.dart';
import '../../cubit/login_states.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController emailController, passController;

  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Prefs.setToken(state.token);
            customSnackBar(
              context,
              message: "Login Successfully",
              type: AnimatedSnackBarType.success,
            );
            context.go(AppRoutes.main);
          }
          if (state is LoginErrorState) {
            customSnackBar(
              context,
              message: state.error,
              type: AnimatedSnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<LoginCubit>();
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      Text(
                        'Login to your account',
                        style: AppStyles.textSemiBold32,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "It's great to see you again",
                        style: AppStyles.textRegular16.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      CustomTextFieldWithLabel(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        label: "Email",
                        hint: "Enter your email address",
                        validator: Validators.email,
                      ),
                      SizedBox(height: 16.h),
                      PasswordField(
                        controller: passController,
                        labelText: "Password",
                        hintText: 'Enter your password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => context.push(AppRoutes.forgetPassword),
                          child: Text(
                            'Forgot password ?',
                            style: AppStyles.textMedium14,
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),
                      state is LoginLoadingState
                          ? Center(child: CircularProgressIndicator())
                          : CustomButton(
                              text: 'Login',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  cubit.userLogin(
                                    email: emailController.text,
                                    password: passController.text,
                                  );
                                }
                              },
                            ),
                      SizedBox(height: 24),
                      const SocialButtonsRow(),
                      const SizedBox(height: 32),
                      NotOrHaveAccountText(
                        text: "Don’t have an account? ",
                        buttonText: "Join",
                        onTap: () {
                          context.push(AppRoutes.register);
                        },
                      ),
                      const SizedBox(height: 24),
                    ],
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
