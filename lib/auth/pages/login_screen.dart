import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/auth/components/auth_button.dart';
import 'package:solvro_basket_buddy/auth/components/auth_text_field.dart';
import 'package:solvro_basket_buddy/auth/components/password_text_field.dart';
import 'package:solvro_basket_buddy/products/bloc/product_bloc.dart';
import 'package:solvro_basket_buddy/shopping_lists/bloc/shopping_lists_bloc.dart';

class LoginScreen extends StatefulWidget {


  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context, AuthBloc authBloc) {
    FocusManager.instance.primaryFocus?.unfocus();
    authBloc.add(LoginEvent(emailController.text, passwordController.text));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final ShoppingListsBloc shoppingListsBloc = BlocProvider.of<ShoppingListsBloc>(context);
    final ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        extendBodyBehindAppBar: true,
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
              shoppingListsBloc.add(FetchShoppingLists(state.token));
              productBloc.add(FetchProducts(state.token));
            }
            else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.props[0] as String),
                  duration: const Duration(seconds: 3),
                ),
              );
            }
           },
          builder:(context, state) {
            if (state is AuthLoading || state is LoggedIn) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else {
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
                      onTap:() => login(context, authBloc),
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
              );
            }
          }
        ),
      ),
    );
  }
}