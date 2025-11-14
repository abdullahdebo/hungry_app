import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_text.dart';

SnackBar customSnack(errorMsg) {
  return SnackBar(
    content: Row(
      children: [
        Icon(CupertinoIcons.info, color: Colors.white, size: 14),
        Gap(10),
        CustomText(
          text: errorMsg,
          color: Colors.white,
          size: 12,
          weight: FontWeight.w500,
        ),
      ],
    ),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: EdgeInsets.only(bottom: 30, right: 20, left: 20),
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    clipBehavior: Clip.none,
    backgroundColor: Colors.red.shade900,
  );
}
