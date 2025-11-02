import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CustomAuthBtn extends StatelessWidget {
  const CustomAuthBtn({
    super.key,
    this.onTap,
    required this.text,
  });
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 55,
        width: double.infinity,
        child: Center(
          child: CustomText(
            text: text,
            weight: FontWeight.bold,
            color: AppColors.primaryColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}
