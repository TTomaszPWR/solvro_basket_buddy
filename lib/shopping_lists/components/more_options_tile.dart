import 'package:flutter/material.dart';

class MoreOptionsTile extends StatelessWidget {

  final String text;
  final Color? color;
  final IconData icon;
  final Function() onTap;

  const MoreOptionsTile({super.key, required this.text, required this.color, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: color,
        size: 25,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 22,
          fontWeight: FontWeight.w600
        ),
      ),
      onTap: onTap,
    );
  }
}