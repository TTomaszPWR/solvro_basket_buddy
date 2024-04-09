part of 'shopping_lists_bloc.dart';

sealed class ShoppingListsEvent extends Equatable {
  const ShoppingListsEvent();

  @override
  List<Object> get props => [];
}

class FetchShoppingLists extends ShoppingListsEvent {
  final TokenModel token;

  const FetchShoppingLists(this.token);

  @override
  List<Object> get props => [token];
}

class AddShoppingList extends ShoppingListsEvent {
  final TokenModel token;
  final String name;
  final String color;
  final String emoji;

  const AddShoppingList(this.token, this.name, this.color, this.emoji);

  @override
  List<Object> get props => [token];
}

class DeleteShoppingList extends ShoppingListsEvent {
  final TokenModel token;
  final int listId;

  const DeleteShoppingList(this.token, this.listId);

  @override
  List<Object> get props => [token, listId];
}

class UpdateShoppingList extends ShoppingListsEvent {
  final TokenModel token;
  final int listId;
  final String name;
  final String color;
  final String emoji;
  final bool isActive;

  const UpdateShoppingList(this.token, this.listId, this.name, this.color, this.emoji, this.isActive);

  @override
  List<Object> get props => [token, listId, name, color, emoji, isActive];
}

class UpdateShoppingItem extends ShoppingListsEvent {
  final TokenModel token;
  final int listId;
  final int itemId;
  final int productId;
  final double quantity;
  final Unit unit;
  final bool isBought;


  const UpdateShoppingItem(this.token, this.listId, this.itemId, this.isBought, this.productId, this.quantity, this.unit);

  @override
  List<Object> get props => [token, listId, itemId, isBought, productId, quantity, unit];
}

class AddShoppingItem extends ShoppingListsEvent {
  final TokenModel token;
  final int listId;
  final int productId;
  final double quantity;
  final Unit unit;

  const AddShoppingItem(this.token, this.listId, this.productId, this.quantity, this.unit);

  @override
  List<Object> get props => [token, listId, productId, quantity, unit];
}

