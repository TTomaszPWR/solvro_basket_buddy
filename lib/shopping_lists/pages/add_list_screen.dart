import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/components/my_button.dart';
import 'package:solvro_basket_buddy/components/my_text_field.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/bloc/shopping_lists_bloc.dart';
import 'package:solvro_basket_buddy/shopping_lists/components/color_buttons.dart';
import 'package:solvro_basket_buddy/shopping_lists/exceptions/no_color_exception.dart';

class AddListScreen extends StatefulWidget {
  const AddListScreen({super.key});

  @override
  State<AddListScreen> createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {

  final TextEditingController controller = TextEditingController();

  final List<bool> _selections = [true,false,false];

  String getColor(){
    for(int i=0;i<_selections.length; i++){
      if(_selections[i]){
        switch(i){
          case 0 : return "red";
          case 1 : return "blue";
          case 2 : return "orange";
        }
      }
    }
    throw NoColorException('Nie wybrano koloru');
  }

  void onTap() {
    BlocProvider.of<ShoppingListsBloc>(context).add(AddShoppingList(
      BlocProvider.of<AuthBloc>(context).state.props[0] as TokenModel,
      controller.text,
      getColor(),
      'e'
      )
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.only(top:0, left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children:[
                  Image.asset(
                    'assets/images/to-do-list.png',
                    height: 130,
                    width: 130,
                  ),
                  
                  const SizedBox(height: 25),

                  MyTextField(
                    hintText: 'List name',
                    controller: controller,
                  ),

                  const SizedBox(height: 20),

                  ColorButtons(selections: _selections)
                ]
              )
            ),
            MyButton(onTap: onTap, text: 'Dodaj listę',)
          ],
        ),
      )
    );
  }
}