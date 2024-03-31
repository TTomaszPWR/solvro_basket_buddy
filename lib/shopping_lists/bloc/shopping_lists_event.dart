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

class GetItem extends ShoppingListsEvent {
  final TokenModel token;
  final int itemId;
  final int listId;

  const GetItem(this.token, this.itemId, this.listId);

  @override
  List<Object> get props => [token, itemId, listId];
}
