import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/auth/components/auth_button.dart';
import 'package:solvro_basket_buddy/auth/components/auth_text_field.dart';
import 'package:solvro_basket_buddy/auth/components/password_text_field.dart';
import 'package:solvro_basket_buddy/auth/pages/login_screen.dart';
import 'package:solvro_basket_buddy/shopping_lists/bloc/shopping_lists_bloc.dart';


class RegisterScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  
  RegisterScreen({super.key});

  void register(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if(passwordController1.text != passwordController2.text){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          duration: Duration(seconds: 5),
        ),
      );
    }else {
      BlocProvider.of<AuthBloc>(context).add(RegisterEvent(emailController.text, passwordController1.text));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc,AuthState>(
        listener: (context, state) { 
          if (state is LoggedOut) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Logged out successfully'),
                duration: Duration(seconds: 2),
              ),
            );
          }
          else if (state is LoggedIn) {
            Navigator.pushNamed(context, '/home');
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Zalogowano się poprawnie'),
                  duration: Duration(seconds: 2),
                ),
              );
              BlocProvider.of<ShoppingListsBloc>(context).add(FetchShoppingLists(state.token));
          }
          else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.props[0] as String),
                duration: Duration(seconds: 3),
              ),
            );
          }
         },
        builder:(context, state) {
          if (state is AuthLoading || state is LoggedIn) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock,
                    size: 120,
                  ),
            
                  const SizedBox(height: 45),
            
                  Text(
                    "Hello! Welcome to Application.",
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
                    controller: passwordController1,
                  ),
          
                  const SizedBox(height: 10),
          
                  PasswordTextField(
                    hintText: 'Repeat Password',
                    controller: passwordController2,
                  ),
            
                  const SizedBox(height: 35),
            
                  AuthButton(
                    text: "Register now",
                    onTap:() => register(context),
                  ),
            
                  const SizedBox(height: 7),
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Do you have an account?",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          "Sign in now",
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
            );
          }
        }
      ),
    );
  }
}