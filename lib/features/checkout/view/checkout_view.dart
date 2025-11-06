import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/checkout/widget/order_details.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedMethod = 'Cash';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Order summary',
                size: 20,
                weight: FontWeight.w500,
              ),
              Gap(10),
              Orderdetails(
                order: '18.5',
                taxes: '3.5',
                fees: '2.0',
                total: '24',
              ),
              Gap(50),
              CustomText(
                text: 'Payment methodes',
                size: 20,
                weight: FontWeight.w500,
              ),
              Gap(20),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMethod = 'Cash';
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
                tileColor: Color(0xff3C2F2F),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                leading: Image.asset(
                  'assets/icon/dollar.png',
                  width: 50,
                ),
                title: CustomText(
                  text: 'Cash on Delivery',
                  color: Colors.white,
                ),
                trailing: Radio<String>(
                  activeColor: Colors.white,
                  value: 'Cash',
                  groupValue: selectedMethod,
                  onChanged: (v) {
                    setState(() {
                      selectedMethod = v!;
                    });
                  },
                ),
              ),
              Gap(10),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMethod = 'Visa';
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
                tileColor: Colors.blue.shade900,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 16,
                ),
                leading: Image.asset(
                  'assets/icon/visa.png',
                  width: 50,
                  color: Colors.white,
                ),
                title: CustomText(
                  text: 'Debit card',
                  color: Colors.white,
                ),
                subtitle: CustomText(
                  text: '**** **** **** 2376',
                  color: Colors.white,
                ),
                trailing: Radio<String>(
                  activeColor: Colors.white,
                  value: 'Visa',
                  groupValue: selectedMethod,
                  onChanged: (v) {
                    setState(() {
                      selectedMethod = v!;
                    });
                  },
                ),
              ),
              Gap(10),
              Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xFFef2a39),
                    value: true,
                    onChanged: (v) {},
                  ),
                  CustomText(
                    text:
                        'Save card details for future payments',
                  ),
                ],
              ),
              Gap(300),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Total', size: 16),
                  CustomText(text: '\$18.9', size: 20),
                ],
              ),
              CustomButton(
                text: 'Pay Now',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 20,
                            vertical: 200,
                          ),
                          child: Container(
                            width: 300,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadiusDirectional.circular(
                                    30,
                                  ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor:
                                      AppColors.primaryColor,
                                  child: Icon(
                                    CupertinoIcons.check_mark,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                Gap(10),
                                CustomText(
                                  text: 'Success !',
                                  color: AppColors.primaryColor,
                                  size: 30,
                                ),
                                Gap(10),
                                CustomText(
                                  text:
                                      ' Your payment was successful. \n A receipt for this purchase \n has been sent to your email ',
                                  color: Colors.grey.shade600,
                                  size: 14,
                                  weight: FontWeight.w400,
                                ),
                                Gap(15),
                                CustomButton(
                                  text: 'Close',
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
