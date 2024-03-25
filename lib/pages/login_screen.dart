
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solvro_basket_buddy/utils/components/auth_button.dart';
import 'package:solvro_basket_buddy/utils/components/auth_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock,
              size: 120,
            ),

            const SizedBox(height: 45),

            Text(
              "Welcome back, you've been missed!",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
              ),
            ),
            
            const SizedBox(height: 15),

            const AuthTextFieldComponent(
              hintText: 'Email',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            const AuthTextFieldComponent(
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 35),

            AuthButton(
              onTap: () {print ('Sign in button pressed');},
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
                  onTap: () {print('Register now button pressed');},
                  child: const Text(
                    'Register now',
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
    );
  }
}