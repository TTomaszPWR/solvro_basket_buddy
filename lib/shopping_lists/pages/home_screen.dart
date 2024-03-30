import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/bloc/shopping_lists_bloc.dart';

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
          title: const Text('Moje listy'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: _logout,
            ),
          ],
        ),
      
        body:BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoggedIn) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Zalogowano się poprawnie'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: Center(
            child: BlocBuilder<ShoppingListsBloc, ShoppingListsState>(
              builder: (context, state) {
                if (state is ShoppingListsLoading) {
                  return const CircularProgressIndicator();
                }else if (state is ShoppingListsLoaded){
                  return ListView.builder(
                    itemCount: state.shoppingLists.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.shoppingLists[index].name),
                      );
                    },

                    //Todo
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
      ),
    );
  }
}