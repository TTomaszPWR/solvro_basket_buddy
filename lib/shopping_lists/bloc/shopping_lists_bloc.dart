
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/shopping_list_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/unitEnum.dart';
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
      
    });

    on<AddShoppingList>((event, emit) async {
      final shoppingLists = List<ShoppingListModel>.from((state as ShoppingListsLoaded).shoppingLists);

      emit(ShoppingListsLoading());
      try{
        shoppingLists.add(await _shoppingListsRepository.addList(event.token, event.name, event.color, event.emoji));

        emit(ShoppingListsLoaded(shoppingLists));
      }catch(e){
        emit(ShoppingListsLoadingError(e.toString()));
        emit(ShoppingListsLoaded(shoppingLists));
      }

    });

    on<DeleteShoppingList>((event, emit) async {
      final shoppingLists = List<ShoppingListModel>.from((state as ShoppingListsLoaded).shoppingLists);

      emit(ShoppingListsLoading());
      try{
        await _shoppingListsRepository.deleteList(event.token, event.listId);

        shoppingLists.removeWhere((element) => element.id == event.listId);

        emit(ShoppingListsLoaded(shoppingLists));
      }catch(e){
        emit(ShoppingListsLoadingError(e.toString()));
        emit(ShoppingListsLoaded(shoppingLists));
      }
    });

    on<UpdateShoppingList>((event, emit) async {
      final shoppingLists = List<ShoppingListModel>.from((state as ShoppingListsLoaded).shoppingLists);

      emit(ShoppingListsLoading());
      try{
        await _shoppingListsRepository.updateList(event.token, event.listId, event.name, event.color, event.emoji, event.isActive);

        shoppingLists.firstWhere((element) => element.id == event.listId).name = event.name;
        shoppingLists.firstWhere((element) => element.id == event.listId).color = event.color;
        shoppingLists.firstWhere((element) => element.id == event.listId).emoji = event.emoji;
        shoppingLists.firstWhere((element) => element.id == event.listId).isActive = event.isActive;

        emit(ShoppingListsLoaded(shoppingLists));
      }catch(e){
        emit(ShoppingListsLoadingError(e.toString()));
        emit(ShoppingListsLoaded(shoppingLists));
      }
    });

    on<UpdateShoppingItem>((event, emit) async {
      final shoppingLists = List<ShoppingListModel>.from((state as ShoppingListsLoaded).shoppingLists);

      emit(ShoppingListsLoading());
      try{
        await _shoppingListsRepository.updateItem(event.token, event.listId, event.itemId, event.productId, event.quantity, event.unit, event.isBought);
        shoppingLists.firstWhere((element) => element.id == event.listId).items.firstWhere((element) => element.id == event.itemId).isBought = event.isBought;
        emit(ShoppingListsLoaded(shoppingLists));
      }catch(e){
        emit(ShoppingItemError(e.toString()));
        emit(ShoppingListsLoaded(shoppingLists));
      }

    });

    on<AddShoppingItem>((event, emit) async {
      final shoppingLists = List<ShoppingListModel>.from((state as ShoppingListsLoaded).shoppingLists);

      emit(ShoppingListsLoading());
      try{
        shoppingLists.firstWhere((element) => element.id == event.listId).items.add(await _shoppingListsRepository.addItem(event.token, event.listId, event.productId, event.quantity, event.unit));

        emit(ShoppingListsLoaded(shoppingLists));
      }catch(e){
        emit(ShoppingItemError(e.toString()));
        emit(ShoppingListsLoaded(shoppingLists));
      }
    });
  }
}
