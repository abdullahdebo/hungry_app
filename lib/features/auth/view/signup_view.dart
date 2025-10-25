import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_btn.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =
        TextEditingController();
    TextEditingController nameController =
        TextEditingController();
    TextEditingController passController =
        TextEditingController();
    TextEditingController confirmPassController =
        TextEditingController();
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Gap(125),
                SvgPicture.asset('assets/logo/logo.svg'),
                Gap(60),
                CustomTextField(
                  controller: nameController,
                  hint: 'Your Name',
                  isPassword: false,
                ),
                Gap(15),
                CustomTextField(
                  controller: emailController,
                  hint: 'Email Address',
                  isPassword: false,
                ),
                Gap(15),
                CustomTextField(
                  controller: passController,
                  hint: 'Password',
                  isPassword: true,
                ),
                Gap(15),
                CustomTextField(
                  controller: confirmPassController,
                  hint: 'Confirm Password',
                  isPassword: true,
                ),
                Gap(30),
                CustomAuthBtn(
                  text: 'Sign Up',
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      print('Sign Up Clicked');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
