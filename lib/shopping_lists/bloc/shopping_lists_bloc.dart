import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/shopping_list_item_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/repo/shopping_lists_repository.dart';

part 'shopping_lists_event.dart';
part 'shopping_lists_state.dart';

class ShoppingListsBloc extends Bloc<ShoppingListsEvent, ShoppingListsState> {
  final ShoppingListsRepository _shoppingListsRepository;
  ShoppingListsBloc(this._shoppingListsRepository) : super(ShoppingListsNotLoaded()) {
    on<FetchShoppingLists>((event, emit) async {
      emit(ShoppingListsLoading());
      try {
        final shoppingLists = await _shoppingListsRepository.fetch(event.token);
        emit(ShoppingListsLoaded(shoppingLists));
      } catch (e) {
        emit(ShoppingListsLoadingError());
      }
    });
  }
}
