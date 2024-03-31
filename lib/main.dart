import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/auth/pages/login_screen.dart';
import 'package:solvro_basket_buddy/auth/pages/register_screen.dart';
import 'package:solvro_basket_buddy/auth/repo/user_repository.dart';
import 'package:solvro_basket_buddy/shopping_lists/bloc/shopping_lists_bloc.dart';
import 'package:solvro_basket_buddy/shopping_lists/pages/home_screen.dart';
import 'package:solvro_basket_buddy/shopping_lists/repo/shopping_lists_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ShoppingListsRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              RepositoryProvider.of<UserRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ShoppingListsBloc(
              RepositoryProvider.of<ShoppingListsRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/home': (context) => const Home(),
          },
        ),
      ),
    );
  }
}
