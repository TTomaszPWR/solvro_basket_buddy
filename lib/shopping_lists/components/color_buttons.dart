import 'package:flutter/material.dart';

class ColorButtons extends StatefulWidget {

  final List<bool> selections;

  const ColorButtons({super.key, required this.selections});


  @override
  State<ColorButtons> createState() => _ColorButtonsState();
}

class _ColorButtonsState extends State<ColorButtons> {


  void onPressedColor(int index) {
    setState(() {
      for (int buttonIndex = 0; buttonIndex < widget.selections.length; buttonIndex++) {
        if (buttonIndex == index) {
          widget.selections[buttonIndex] = true;
        } else {
          widget.selections[buttonIndex] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: widget.selections,
      onPressed: onPressedColor,
      renderBorder: false,
      children: const [
        Icon(Icons.circle, color: Colors.red),
        Icon(Icons.circle, color: Colors.blue),
        Icon(Icons.circle, color: Colors.orange),
      ]
    );
  }
}