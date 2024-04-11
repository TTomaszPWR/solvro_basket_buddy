import 'package:flutter/material.dart';

class AddFloatingActionButton extends StatelessWidget {
  const AddFloatingActionButton({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => onPressed(),
      backgroundColor: Colors.green[400],
      icon: const Icon(
        Icons.add,
        color: Colors.black,
      ),
      label: const Text(
        'Dodaj',
        style: TextStyle(
          color: Colors.black,
        )
      ),
    );
  }
}