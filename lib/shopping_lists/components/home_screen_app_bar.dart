import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  void _logout(BuildContext context){
    BlocProvider.of<AuthBloc>(context).add(LogoutEvent(BlocProvider.of<AuthBloc>(context).state.props[0] as TokenModel));
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          icon: const Icon(Icons.logout),
          onPressed:() => _logout(context),
        ),
      ],
      backgroundColor: Colors.grey[300],
    );
  }
}