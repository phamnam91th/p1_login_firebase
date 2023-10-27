

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final bool obscureText;

  const MyTextField({super.key, required this.controller, required this.hint, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          )
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            )
        ),
        fillColor: Colors.grey,
        filled: true,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.blueGrey)
      ),
    );
  }
}