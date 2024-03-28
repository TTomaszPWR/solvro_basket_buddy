import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/auth/components/auth_button.dart';
import 'package:solvro_basket_buddy/auth/components/auth_text_field.dart';
import 'package:solvro_basket_buddy/auth/components/password_text_field.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  LoginScreen({super.key});

  void login(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(AuthLoginEvent(emailController.text, passwordController.text));
    Navigator.pushNamed(context, '/home');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      extendBodyBehindAppBar: true,
      body: BlocListener<AuthBloc,AuthState>(
        listener: (context, state) { 
          if (state is LoggedOutState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Logged out successfully'),
                duration: Duration(seconds: 2),
              ),
            );
          }
         },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                size: 120,
              ),
        
              const SizedBox(height: 45),
        
              Text(
                "Welcome back! You've been missed.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              
              const SizedBox(height: 15),
        
              AuthTextField(
                hintText: 'Email',
                controller: emailController,
              ),
        
              const SizedBox(height: 10),
        
              PasswordTextField(
                hintText: 'Password',
                controller: passwordController,
              ),
        
              const SizedBox(height: 35),
        
              AuthButton(
                text: "Sign in",
                onTap:() => login(context),
              ),
        
              const SizedBox(height: 7),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/register'),
                    child: const Text(
                      "Register now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}