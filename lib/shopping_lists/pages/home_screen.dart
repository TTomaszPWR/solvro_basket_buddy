import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/bloc/shopping_lists_bloc.dart';
import 'package:solvro_basket_buddy/shopping_lists/components/home_screen_app_bar.dart';
import 'package:solvro_basket_buddy/shopping_lists/components/shopping_list_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final ShoppingListsBloc shoppingListsBloc = BlocProvider.of<ShoppingListsBloc>(context);
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: HomeScreenAppBar(),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add_list');
          },
          backgroundColor: Colors.grey[700],
          child: const Icon(Icons.add),
        ),

        backgroundColor: Colors.grey[300],
      
        body:Center(
          child: BlocBuilder<ShoppingListsBloc, ShoppingListsState>(
            builder: (context, state) {
              if (state is ShoppingListsLoading) {
                return const CircularProgressIndicator();
              }else if (state is ShoppingListsLoaded){
                return ListView.builder(
                  itemCount: state.shoppingLists.length,
                  itemBuilder: (context, index) {
                    return ShoppingListTile(index: index);
                  },
                );
              }else if (state is ShoppingListsLoadingError){
                return const Text('Wystąpił błąd podczas ładowania listy zakupów');
              }else {
                return const Text('Listy niezaładowane');
              }
            },
          ),
        ),
      ),
    );
  }
}