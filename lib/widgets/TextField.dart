import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final dynamic fillColor;
  final Color color;
  final Color borderColor;

  const TextFields({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.color,
    required this.borderColor,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(8)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor),
        ),
        fillColor: color,
        filled: true,
        hintText: hintText,
      ),
    );
  }
}
