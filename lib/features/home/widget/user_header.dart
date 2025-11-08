import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/view/profile_view.dart';
import 'package:hungry_app/shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/logo/logo.svg',
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
              height: 40,
            ),
            Gap(7),
            CustomText(
              text: 'Hello , Abdullah',
              size: 18,
              weight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => ProfileView()),
            );
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.primaryColor,
            child: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
