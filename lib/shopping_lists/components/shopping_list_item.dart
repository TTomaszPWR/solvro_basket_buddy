import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/shopping_lists/bloc/shopping_lists_bloc.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/shopping_list_item_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/shopping_list_model.dart';

class ShoppingListItem extends StatefulWidget {

  final int listIndex;
  final int itemIndex;

  const ShoppingListItem({super.key, required this.listIndex, required this.itemIndex});

  @override
  State<ShoppingListItem> createState() => _ShoppingListItemState();
}

class _ShoppingListItemState extends State<ShoppingListItem> {


  void toggleBought(ShoppingListModel list, ShoppingItemModel item, ShoppingListsBloc shoppingbloc, AuthBloc authBloc) {
    setState(() {
      shoppingbloc.add(UpdateShoppingItem((authBloc.state as LoggedIn).token, list.id, item.id, !item.isBought,  item.product.id, item.quantity, item.unit));
    });
  }

  @override
  Widget build(BuildContext context) {
    final listIndex = widget.listIndex;
    final itemIndex = widget.itemIndex;

    final shoppingbloc = BlocProvider.of<ShoppingListsBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);

    final list = shoppingbloc.state.props[0] as List<ShoppingListModel>;
    final ShoppingListModel shoppingList = list[listIndex];
    final item = shoppingList.items[itemIndex];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            item.isBought ? Icons.check_circle : Icons.circle_outlined,
            color: item.isBought ? Colors.green : Colors.grey
          ),
          onPressed: () => toggleBought(shoppingList, item, shoppingbloc, authBloc),
        ),
        title: Text(item.product.name),
        subtitle: Text('${item.quantity % 1 == 0 ? item.quantity.toInt() : item.quantity} ${item.unit.toShortString()}'),
      ),
    );
  }
}