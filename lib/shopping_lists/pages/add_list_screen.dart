import 'package:flutter/material.dart';

class AddListScreen extends StatelessWidget {
  AddListScreen({super.key});

  final List<bool> _selections = List.generate(3, (_) => false);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'List name',
            ),
          ),
          ToggleButtons(children: [], isSelected: _selections),
          TextButton(onPressed: (){}, child: const Text('Add list'))
        ],
      )
    );
  }
}