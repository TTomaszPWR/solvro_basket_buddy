import 'package:flutter/material.dart';

class AuthTextFieldComponent extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;

  const AuthTextFieldComponent({
    super.key,
    this.controller,
    this.hintText = 'Enter your text',
    this.obscureText = false,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: Colors.grey.shade600,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintStyle: TextStyle(color: Colors.grey.shade500,),
        ),
      ),
    );
  }
}