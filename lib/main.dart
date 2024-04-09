import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/auth/pages/login_screen.dart';
import 'package:solvro_basket_buddy/auth/pages/register_screen.dart';
import 'package:solvro_basket_buddy/auth/repo/user_repository.dart';
import 'package:solvro_basket_buddy/product_category/bloc/product_category_bloc.dart';
import 'package:solvro_basket_buddy/product_category/repo/product_category_repository.dart';
import 'package:solvro_basket_buddy/products/bloc/product_bloc.dart';
import 'package:solvro_basket_buddy/products/repo/product_repository.dart';
import 'package:solvro_basket_buddy/shopping_lists/bloc/shopping_lists_bloc.dart';
import 'package:solvro_basket_buddy/shopping_lists/pages/search_item_screen.dart';
import 'package:solvro_basket_buddy/shopping_lists/pages/add_list_screen.dart';
import 'package:solvro_basket_buddy/shopping_lists/pages/home_screen.dart';
import 'package:solvro_basket_buddy/shopping_lists/pages/list_screen.dart';
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
        RepositoryProvider(
          create:(context) => ProductCategoryRepository()
        ),
        RepositoryProvider(
          create:(context) => ProductCategoryRepository()
        ),
        RepositoryProvider(
          create: (context) => ProductRepository()
        )
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
          BlocProvider(
            create: (context) => ProductCategoryBloc(
              RepositoryProvider.of<ProductCategoryRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ProductBloc(
              RepositoryProvider.of<ProductRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Solvro Basket Buddy',
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/home': (context) => const Home(),
            '/add_list': (context) => const AddListScreen(),
            '/list':(context) => const ListScreen(),
            '/add_item':(context) => const SearchItemScreen(),
          },
        ),
      ),
    );
  }
}
