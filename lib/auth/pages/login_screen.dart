
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/auth/pages/auth_screen_template.dart';


class LoginScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return AuthScreenTemplate(
      icon: Icons.lock, 
      welcomeText: "Welcome back! You've been missed.", 
      buttonText: "Sign in", 
      bottomText: "Don't have an account?", 
      bottomTextAction: "Register now",
      authButtonOnTap: () { 
        authBloc.add(AuthLoginEvent(emailController.text, passwordController.text));
        Navigator.pushNamed(context, '/home');
      },
      bottomTextActionOnTap:() => Navigator.pushNamed(context, '/register'),
      emailController: emailController,
      passwordController: passwordController,
    );
  }
}