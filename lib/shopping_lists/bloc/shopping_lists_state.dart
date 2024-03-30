part of 'shopping_lists_bloc.dart';

sealed class ShoppingListsState extends Equatable {
  const ShoppingListsState();
  
  @override
  List<Object> get props => [];
}

class ShoppingListsLoading extends ShoppingListsState {}

class ShoppingListsLoaded extends ShoppingListsState {
  final List<ShoppingItemModel> shoppingLists;

  const ShoppingListsLoaded(this.shoppingLists);

  @override
  List<Object> get props => [shoppingLists];
}

class ShoppingListsLoadingError extends ShoppingListsState {}

class ShoppingListsNotLoaded extends ShoppingListsState {}