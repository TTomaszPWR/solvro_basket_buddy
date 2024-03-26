
import 'package:flutter/material.dart';
import 'package:solvro_basket_buddy/auth/components/auth_button.dart';
import 'package:solvro_basket_buddy/auth/components/auth_text_field.dart';
import 'package:solvro_basket_buddy/auth/components/password_text_field.dart';

class AuthScreenTemplate extends StatelessWidget {

  final IconData? icon;
  final String welcomeText;
  final String buttonText;
  final String bottomText;
  final String bottomTextAction;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function()? authButtonOnTap;
  final Function()? bottomTextActionOnTap;

  const AuthScreenTemplate({
    super.key, 
    required this.icon, 
    required this.welcomeText, 
    required this.buttonText,
    required this.bottomText, 
    required this.bottomTextAction, 
    required this.emailController, 
    required this.passwordController, 
    this.authButtonOnTap, 
    this.bottomTextActionOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 120,
            ),

            const SizedBox(height: 45),

            Text(
              welcomeText,
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
              text: buttonText,
              onTap: authButtonOnTap,
            ),

            const SizedBox(height: 7),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  bottomText,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: bottomTextActionOnTap,
                  child: Text(
                    bottomTextAction,
                    style: const TextStyle(
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
    );
  }
}