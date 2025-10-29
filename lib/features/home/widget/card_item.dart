import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.name,
    required this.desc,
    required this.rate,
  });

  final String image, name, desc, rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, width: 180),
            Gap(7),
            CustomText(text: name, weight: FontWeight.bold),
            CustomText(text: desc),
            CustomText(text: rate),
          ],
        ),
      ),
    );
  }
}
