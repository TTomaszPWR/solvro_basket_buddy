
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/shopping_list_model.dart';
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
        emit(ShoppingListsLoadingError(e.toString()));
      }
      
      print(state.props);
    });

    on<AddShoppingList>((event, emit) async {
      final shoppingLists = List<ShoppingListModel>.from((state as ShoppingListsLoaded).shoppingLists);

      emit(ShoppingListsLoading());
      shoppingLists.add(await _shoppingListsRepository.addList(event.token, event.name, event.color, event.emoji));

      emit(ShoppingListsLoaded(shoppingLists));

    });

    on<DeleteShoppingList>((event, emit) async {
      final shoppingLists = List<ShoppingListModel>.from((state as ShoppingListsLoaded).shoppingLists);

      emit(ShoppingListsLoading());
      await _shoppingListsRepository.deleteList(event.token, event.listId);

      shoppingLists.removeWhere((element) => element.id == event.listId);

      emit(ShoppingListsLoaded(shoppingLists));
    });

    on<UpdateShoppingList>((event, emit) async {
      final shoppingLists = List<ShoppingListModel>.from((state as ShoppingListsLoaded).shoppingLists);

      emit(ShoppingListsLoading());
      await _shoppingListsRepository.updateList(event.token, event.listId, event.name, event.color, event.emoji, event.isActive);

      shoppingLists.firstWhere((element) => element.id == event.listId).name = event.name;
      shoppingLists.firstWhere((element) => element.id == event.listId).color = event.color;
      shoppingLists.firstWhere((element) => element.id == event.listId).emoji = event.emoji;
      shoppingLists.firstWhere((element) => element.id == event.listId).isActive = event.isActive;

      emit(ShoppingListsLoaded(shoppingLists));
    });

  }
}
