
import 'package:flutter/material.dart';
import 'package:solvro_basket_buddy/auth/pages/auth_screen_template.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenTemplate(
      icon: Icons.lock, 
      welcomeText: "Welcome back! You've been missed.", 
      buttonText: "Sign in", 
      bottomText: "Don't have an account?", 
      bottomTextAction: "Register now",
      authButtonOnTap: () {},
      bottomTextActionOnTap:() => Navigator.pushNamed(context, '/register')
    );
  }
}