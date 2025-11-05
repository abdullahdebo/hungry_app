// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/product/widget/spicy_slider.dart';
import 'package:hungry_app/features/product/widget/topping_card.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() =>
      _ProductDetailsViewState();
}

class _ProductDetailsViewState
    extends State<ProductDetailsView> {
  double value = 0.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpicySlider(
              value: value,
              onChanged: (v) {
                setState(() => value = v);
                print(value);
              },
            ),
            Gap(20),
            CustomText(text: 'Toppings', size: 20),
            Gap(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ToppingCard(
                    imageUrl: 'assets/details/tomato.png',
                    name: 'Tomato',
                    onAdd: () => print('Added Tomato'),
                  ),
                  Gap(12),
                  ToppingCard(
                    imageUrl: 'assets/details/onion.png',
                    name: 'Onion',
                    onAdd: () => print('Added Onion'),
                  ),
                  Gap(12),
                  ToppingCard(
                    imageUrl: 'assets/details/pickles.png',
                    name: 'Pickles',
                    onAdd: () => print('Added Pickles'),
                  ),
                  Gap(12),
                  ToppingCard(
                    imageUrl: 'assets/details/bacons.png',
                    name: 'Bacons',
                    onAdd: () => print('Added Bacons'),
                  ),
                ],
              ),
            ),
            Gap(35),
            CustomText(text: 'Side Options', size: 20),
            Gap(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ToppingCard(
                    imageUrl: 'assets/details/fries.png',
                    name: 'Fries',
                    onAdd: () => print('Added Fries'),
                  ),
                  Gap(12),
                  ToppingCard(
                    imageUrl: 'assets/details/coleslaw.png',
                    name: 'Coleslaw',
                    onAdd: () => print('Added Coleslaw'),
                  ),
                  Gap(12),
                  ToppingCard(
                    imageUrl: 'assets/details/salad.png',
                    name: 'Salad',
                    onAdd: () => print('Added Salad'),
                  ),
                  Gap(12),
                  ToppingCard(
                    imageUrl: 'assets/details/onionring.png',
                    name: 'Onions',
                    onAdd: () => print('Onions Ring'),
                  ),
                ],
              ),
            ),
            Gap(60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Total', size: 16),
                    CustomText(text: '\$18.9', size: 20),
                  ],
                ),
                CustomButton(
                  text: 'Add To Cart',
                  onTap: () {
                    print('Add To Cart Clicked !');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
