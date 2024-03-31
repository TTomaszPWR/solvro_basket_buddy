import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/shopping_lists/bloc/shopping_lists_bloc.dart';

class ShoppingTile extends StatelessWidget {
  final int index;

  const ShoppingTile({super.key, required this.index});

  Color getColor(String color, int shade) {
    switch (color) {
      case 'red':
        return Colors.red[shade]!;
      case 'blue':
        return Colors.blue[shade]!;
      case 'orange':
        return Colors.orange[shade]!;
      default:
        return Colors.grey[shade]!;
    }
  }

  void moreOptions( context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            ListTile(
              title: const Text('Usuń listę'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Edytuj listę'),
              onTap: () {},
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: BlocBuilder<ShoppingListsBloc, ShoppingListsState>(
        builder: (context, state) {
          if (state is ShoppingListsLoaded) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: getColor(state.shoppingLists[index].color, 400), width: 2),
                borderRadius: BorderRadius.circular(10),
                color: getColor(state.shoppingLists[index].color, 200),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            state.shoppingLists[index].name,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => moreOptions(context),
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.grey[800],
                            size: 28,
                          )
                        ),
                    ],
                  ),
                  Row(
                     children: [
                       Expanded(
                           child: LinearProgressIndicator(
                           value: state.shoppingLists[index]
                               .calcBoughtRatio(),
                           color: Colors.green[400],
                           backgroundColor: getColor(state.shoppingLists[index].color, 100),
                           borderRadius: BorderRadius.circular(6),
                           minHeight: 13,
                         )),
                         const SizedBox(width: 20),
                         Text(state.shoppingLists[index].getProgress(),
                             style: TextStyle(
                               fontSize: 20,
                               color: Colors.grey[800],
                               fontWeight: FontWeight.bold,
                             )),
                         const SizedBox(width: 20),
                       ],
                     ),
                  ],
                )
              )
            );
          }else {
            return const Text('Listy niezaładowane');
          }
        },
      ),
    );
  }
}
