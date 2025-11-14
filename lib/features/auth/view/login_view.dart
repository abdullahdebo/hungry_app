// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/view/signup_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_btn.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =
        TextEditingController();
    TextEditingController passWordController =
        TextEditingController();
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();

    bool isLoading = false;

    AuthRepo authRepo = AuthRepo();

    Future<void> login() async {
      if (formkey.currentState!.validate()) {
        setState(() => isLoading = true);
        try {
          final user = await authRepo.login(
            emailController.text.trim(),
            passWordController.text.trim(),
          );
          if (user != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => Root()),
            );
          }
          setState(() => isLoading = false);
        } catch (e) {
          setState(() => isLoading = false);
          String errorMsg = 'Error In Login ';
          if (e is ApiError) {
            errorMsg = e.message;
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(
                    CupertinoIcons.info,
                    color: Colors.white,
                    size: 14,
                  ),
                  Gap(10),
                  CustomText(
                    text: errorMsg,
                    color: Colors.white,
                    size: 12,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              margin: EdgeInsets.only(
                bottom: 30,
                right: 20,
                left: 20,
              ),
              elevation: 10,
              behavior: SnackBarBehavior.floating,
              clipBehavior: Clip.none,
              backgroundColor: Colors.red.shade900,
            ),
          );
        }
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gap(160),
                  SvgPicture.asset('assets/logo/logo.svg'),
                  Gap(30),
                  CustomText(
                    text:
                        'Welcome Back , Discover Our Fast Food App',
                    color: Colors.white,
                    size: 13,
                    weight: FontWeight.w500,
                  ),
                  Gap(60),
                  CustomTextField(
                    controller: emailController,
                    hint: 'Email Address',
                    isPassword: false,
                  ),
                  Gap(20),
                  CustomTextField(
                    controller: passWordController,
                    hint: 'Password',
                    isPassword: true,
                  ),
                  Gap(30),
                  isLoading
                      ? CupertinoActivityIndicator(
                          color: Colors.white,
                        )
                      : CustomAuthBtn(
                          text: 'Login',
                          onTap: login,
                        ),
                  Gap(30),

                  /// create Account Button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupView(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      height: 55,
                      width: double.infinity,
                      child: Center(
                        child: CustomText(
                          text: 'Create Accont',
                          weight: FontWeight.bold,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Gap(20),
                  Divider(thickness: 1, color: Colors.white24),
                  Gap(20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Root(),
                        ),
                      );
                    },
                    child: CustomText(
                      text: 'Continue as Guest ?',
                      color: Colors.white,
                      size: 14,
                      weight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
