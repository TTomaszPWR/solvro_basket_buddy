import 'package:flutter/material.dart';
import 'package:solvro_basket_buddy/auth/components/auth_button.dart';

  void changeBottomSheet(BuildContext context, String title, Widget widget, Function() onTap) {
    
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.grey[300],
      context: context,
      builder: (context) {
        return Wrap(
          children: [Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800]
                  ),
                ),
                const SizedBox(height: 20,),

                widget,

                const SizedBox(height: 20,),

                AuthButton(
                  text: 'Zapisz',
                  onTap:() {
                    Navigator.pop(context);
                    onTap();
                  }
                ),
              ],
            ),
          ),]
        );
      },
    );
  }