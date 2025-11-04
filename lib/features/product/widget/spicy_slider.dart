import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class SpicySlider extends StatelessWidget {
  const SpicySlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/details/burger1.png', height: 250),
        Spacer(),
        Column(
          children: [
            CustomText(
              text:
                  'Customize Your Burger \n to Your Tastes.\n Ultimate Experience',
              size: 15,
            ),
            Slider(
              min: 0,
              max: 1,
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.primaryColor,
              inactiveColor: Colors.grey.shade300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(text: '🥶'),
                Gap(110),
                CustomText(text: '🌶️'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// Removed unused Gap class; use SizedBox(width: ...) for spacing.
