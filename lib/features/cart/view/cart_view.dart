// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hungry_app/features/cart/widget/card_item.dart';
import 'package:hungry_app/features/checkout/view/checkout_view.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final int itemCount = 4;
  late List<int> quantities;

  @override
  void initState() {
    quantities = List.generate(itemCount, (_) => 1);
    super.initState();
  }

  void onAdd(index) {
    setState(() {
      quantities[index]++;
    });
  }

  void onMin(index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 20, bottom: 120),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return CardItem(
              image: 'assets/splash/test.png',
              text: 'Humburger',
              desc: 'Veggie Burger',
              num: quantities[index],
              onAdd: () => onAdd(index),
              onMin: () => onMin(index),
            );
          },
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.all(15),
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Total', size: 16),
                CustomText(text: '\$18.9', size: 24),
              ],
            ),
            CustomButton(
              width: 120,
              text: 'Checkout',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return CheckoutView();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
