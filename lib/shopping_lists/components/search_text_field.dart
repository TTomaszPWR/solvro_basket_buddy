import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchTextField({super.key, required this.hintText, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
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
          suffixIcon: Icon(Icons.search, color: Colors.grey.shade500)
        )
    );
  }
}