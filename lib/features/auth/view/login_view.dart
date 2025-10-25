import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_btn.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =
        TextEditingController();
    TextEditingController passWordController =
        TextEditingController();

    final GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                  Gap(125),
                  SvgPicture.asset('assets/logo/logo.svg'),
                  Gap(30),
                  CustomText(
                    text:
                        'Welcome Back , Discover The Fast Food',
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
                  CustomAuthBtn(
                    text: 'Login',
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        print('Login Clicked');
                      }
                    },
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
