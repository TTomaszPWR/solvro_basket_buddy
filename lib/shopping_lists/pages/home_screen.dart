import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/bloc/shopping_lists_bloc.dart';
import 'package:solvro_basket_buddy/shopping_lists/components/shopping_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _logout(){
    BlocProvider.of<AuthBloc>(context).add(LogoutEvent(BlocProvider.of<AuthBloc>(context).state.props[0] as TokenModel));
    Navigator.pushNamed(context, '/login');
  }
  
  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Moje listy',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.delete_forever)
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: _logout,
            ),
          ],
          backgroundColor: Colors.grey[300],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<ShoppingListsBloc>(context).add(AddShoppingList(BlocProvider.of<AuthBloc>(context).state.props[0] as TokenModel, 'Nowa lista', 'red', '🛒'));
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
                    return ShoppingTile(index: index);
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