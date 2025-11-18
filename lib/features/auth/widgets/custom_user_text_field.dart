import 'package:flutter/material.dart';

class CustomUserTextField extends StatelessWidget {
  const CustomUserTextField({
    super.key,
    required this.controller,
    required this.lable,
    this.textInputType,
  });

  final TextEditingController controller;
  final String lable;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      cursorColor: Colors.white,
      cursorHeight: 20,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        labelText: lable,
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
