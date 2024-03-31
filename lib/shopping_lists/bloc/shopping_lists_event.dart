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

