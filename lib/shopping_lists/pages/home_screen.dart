import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/shopping_lists/bloc/shopping_lists_bloc.dart';
import 'package:solvro_basket_buddy/shopping_lists/components/add_floating_action_button.dart';
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
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: HomeScreenAppBar(),
        ),

        floatingActionButton: AddFloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/add_list'),
        ),

        backgroundColor: Colors.grey[300],
      
        body:Center(
          child: BlocBuilder<ShoppingListsBloc, ShoppingListsState>(
            builder: (context, state) {
              if (state is ShoppingListsLoading) {
                return const CircularProgressIndicator();
              }else if (state is ShoppingListsLoaded){
                if (state.shoppingLists.isEmpty) {
                  return const Text('Brak list zakupów');
                }else{
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 100),
                    itemCount: state.shoppingLists.length,
                    itemBuilder: (context, index) {
                      return ShoppingListTile(index: index);
                    },
                  );
                }
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