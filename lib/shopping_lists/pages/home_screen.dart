import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Moje listy'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent(BlocProvider.of<AuthBloc>(context).state.props[0] as TokenModel));
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),

      body:BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoggedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Zalogowano się poprawnie'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
      
        child:  const Center(
          child: Text('Moje Listy'),
        ),
      ),
    );
  }
}