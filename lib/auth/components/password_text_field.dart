import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;

  const PasswordTextField({
    super.key,
    this.controller,
    this.hintText = 'Enter your text',
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;
  
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: widget.controller,
        obscureText: !_isPasswordVisible,
        cursorColor: Colors.grey.shade600,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon:Icon(_isPasswordVisible? Icons.visibility_off : Icons.visibility),
            onPressed: _togglePasswordVisibility,
          ),
          hintText: widget.hintText,
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