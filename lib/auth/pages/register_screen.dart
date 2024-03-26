import 'package:flutter/material.dart';
import 'package:solvro_basket_buddy/auth/pages/auth_screen_template.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AuthScreenTemplate(
      icon: Icons.account_circle, 
      welcomeText: "Hello! Welcome to Application.",
      buttonText: "Register now", 
      bottomText: "You have an account?", 
      bottomTextAction: "Sign in now",
      bottomTextActionOnTap:() => Navigator.pop(context)
    );
  }
}