import 'package:flutter/material.dart';

class BottomAuthRow extends StatelessWidget {
  const BottomAuthRow({super.key, required this.text, required this.buttonText, this.onTap});

  final String text;
  final String buttonText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),

        const SizedBox(width: 5),

        GestureDetector(
          onTap: onTap,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}