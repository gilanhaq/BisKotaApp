import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hint,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: blackText.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          obscureText: obscureText ? true : false,
          cursorColor: Colors.grey,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
              borderSide: BorderSide(
                color: primary,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
