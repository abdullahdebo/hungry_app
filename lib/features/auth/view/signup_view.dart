import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/view/login_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_btn.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =
        TextEditingController();
    TextEditingController nameController =
        TextEditingController();
    TextEditingController passController =
        TextEditingController();
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();

    bool isLoading = false;
    AuthRepo authRepo = AuthRepo();

    Future<void> signup() async {
      if (formkey.currentState!.validate()) {
        try {
          setState(() => isLoading = true);
          final user = await authRepo.signup(
            nameController.text.trim(),
            emailController.text.trim(),
            passController.text.trim(),
          );
          if (user != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => LoginView()),
            );
          }
          setState(() => isLoading = false);
        } catch (e) {
          setState(() => isLoading = false);
          String errMsg = 'Erroe In Register';
          if (e is ApiError) {
            errMsg = e.message;
          }
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(customSnack(errMsg));
        }
      }
    }

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Gap(160),
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
                isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1,
                      )
                    : CustomTextField(
                        controller: passController,
                        hint: 'Password',
                        isPassword: true,
                      ),
                Gap(15),
                CustomAuthBtn(text: 'Sign Up', onTap: signup),
                Gap(20),
                Divider(thickness: 1, color: Colors.white24),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginView(),
                      ),
                    );
                  },
                  child: CustomText(
                    text: 'Do You have an account ? Login Now',
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
    );
  }
}
