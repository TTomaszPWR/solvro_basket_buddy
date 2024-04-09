import 'package:flutter/material.dart';

class UnitButtons extends StatefulWidget {

  final List<bool> selections;

  const UnitButtons({super.key, required this.selections});


  @override
  State<UnitButtons> createState() => _UnitButtonsState();
}

class _UnitButtonsState extends State<UnitButtons> {


  void onPressedUnit(int index) {
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
      onPressed: onPressedUnit,
      renderBorder: false,
      children: const [
        UnitText(text: 'szt'),
        UnitText(text: 'kg'),
        UnitText(text: 'g'),
        UnitText(text: 'l'),
        UnitText(text: 'm'),
      ]
    );
  }
}

class UnitText extends StatelessWidget {
  const UnitText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey[800],
        fontWeight: FontWeight.bold,
        fontSize: 16,
      )
    );
  }
}