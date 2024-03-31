import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/shopping_lists/bloc/shopping_lists_bloc.dart';

class ShoppingTile extends StatelessWidget {
  final int index;

  const ShoppingTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400, width: 2),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: BlocBuilder<ShoppingListsBloc, ShoppingListsState>(
            builder: (context, state) {
              if (state is ShoppingListsLoaded){
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            state.shoppingLists[index].name,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        

                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.more_vert, color: Colors.grey[800],)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: LinearProgressIndicator(
                          value: state.shoppingLists[index].calcBoughtRatio(),
                          color: Colors.green[200],
                          backgroundColor: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          minHeight: 13,
                        )),
      
                        const SizedBox(width: 20),
      
                        Text(
                          state.shoppingLists[index].getProgress(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                          )

                        ),
                      ],
                    ),
                  ],
                );
              }else {
                return const Text('Listy niezaładowane');
              }
            },
          )
        ),
      ),
    );
  }
}
