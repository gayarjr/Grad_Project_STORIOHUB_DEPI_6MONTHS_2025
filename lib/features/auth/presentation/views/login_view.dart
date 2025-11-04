import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/text_form_field_with_icon.dart';
import 'package:gradprojectstorio/features/auth/presentation/views/register_page.dart';
import 'package:gradprojectstorio/features/auth/presentation/widgets/auth_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../cubit/login_cubit.dart';
import '../../cubit/login_states.dart';
import 'forgot_password_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginSuccessState) {
            // ✅ Save Token
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString("token", state.token);

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("✅ Login Successful")));

            // ✅ Navigate to Main
            context.go(AppRoutes.main);
          }

          if (state is LoginErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("❌ ${state.error}")));
          }
        },
        builder: (context, state) {
          var cubit = context.read<LoginCubit>();

          return Scaffold(
            appBar: AppBar(automaticallyImplyLeading: false),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login to your account',
                    style: AppStyles.textBold24.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "It's great to see you again",
                    style: AppStyles.textRegular16.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // Email Field
                  TextFormFieldWithIcon(
                    controller: emailController,
                    hintText: 'Enter your email address',
                    label: 'Email',
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(height: 20.h),

                  // Password Field
                  TextFormFieldWithIcon(
                    controller: passController,
                    hintText: 'Enter your password',
                    label: 'Password',
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  SizedBox(height: 12.h),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordView(),
                        ),
                      ),
                      child: Text(
                        'Forgot your password? Reset your password',
                        style: AppStyles.textRegular14.copyWith(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // Login Button with Loading State
                  state is LoginLoadingState
                      ? Center(child: CircularProgressIndicator())
                      : AuthButton(
                          text: 'Login',
                          onTap: () {
                            cubit.userLogin(
                              email: emailController.text,
                              password: passController.text,
                            );
                          },
                        ),
                  SizedBox(height: 20.h),

                  // OR Divider
                  Center(
                    child: Text(
                      'OR',
                      style: AppStyles.textRegular16.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  // SizedBox(height: 20.h),
                  //
                  // // Social Buttons
                  // SocialButton(
                  //   text: 'Login with Google',
                  //   iconPath: 'assets/images/google_icon.png',
                  //   onPressed: () {
                  //     /* TODO: Google login logic */
                  //   },
                  // ),
                  // SizedBox(height: 16.h),
                  // SocialButton(
                  //   text: 'Login with Facebook',
                  //   iconPath: 'assets/images/facebook_icon.png',
                  //   onPressed: () {},
                  //   backgroundColor: AppColors.facebookColor,
                  //   textColor: AppColors.white,
                  // ),
                  SizedBox(height: 40.h),

                  // Don't have an account?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: AppStyles.textRegular14.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        ),
                        child: Text(
                          ' Join',
                          style: AppStyles.textBold16.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
