import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:solvro_basket_buddy/api/base_client.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/shopping_list_item_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/shopping_list_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/unitEnum.dart';

class ShoppingListsRepository {
  var client = http.Client();

  Future<http.Response> _sendRequest(String path, TokenModel token) async {
    var url = Uri.parse('${baseUrl}$path');
    var headers = {
      'Authorization': 'Token ${token.token}'
    };
    return await client.get(url, headers: headers);
  }

  Future<List<ShoppingListModel>> fetch(TokenModel token) async {
    var response = await _sendRequest('shopping-lists/', token);

    print(utf8.decode(response.bodyBytes));

    if(response.statusCode >= 200 && response.statusCode < 300){
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<ShoppingListModel> shoppingLists = body.map((dynamic item) => ShoppingListModel.fromMap(item)).toList();

      return shoppingLists;
    }else{
      throw http.ClientException('Failed to load shopping lists');
    }
  }

  Future<ShoppingItemModel> getItem(TokenModel token, int listId, int itemId,) async {
    var response = await _sendRequest('shopping-lists/$listId/items/$itemId/', token);
    print(response.body);
    if(response.statusCode >= 200 && response.statusCode < 300){
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      var item = ShoppingItemModel.fromMap(body);
      return item;
    }else{
      throw http.ClientException('Failed to load item');
    }
  }

  Future<void> deleteList(TokenModel token, int listId) async {
    var url = Uri.parse('${baseUrl}shopping-lists/$listId/');
    var headers = {
      'Authorization': 'Token ${token.token}'
    };
    var response = await client.delete(url, headers: headers);
    if(response.statusCode >= 200 && response.statusCode < 300){
      return;
    }else{
      throw http.ClientException('Failed to delete list');
    }
  }

  Future<void> deleteItem(TokenModel token, int listId, int itemId) async {
    var url = Uri.parse('${baseUrl}shopping-lists/$listId/items/$itemId/');
    var headers = {
      'Authorization': 'Token ${token.token}'
    };
    var response = await client.delete(url, headers: headers);
    if(response.statusCode >= 200 && response.statusCode < 300){
      return;
    }else{
      throw http.ClientException('Failed to delete list');
    } 
  }

  Future<ShoppingListModel> addList(TokenModel token, String name, String color, String emoji) async {
    var url = Uri.parse('${baseUrl}shopping-lists/');
    var headers = {
      'Authorization': 'Token ${token.token}'
    };
    var body = {
      "name": name,
      "color": color,
      "emoji": emoji,
      "isActive": 'true'
    };
    var response = await client.post(url, headers: headers, body: body);
    print(response.body);
    if(response.statusCode >= 200 && response.statusCode < 300){
      return ShoppingListModel.fromJson(utf8.decode(response.bodyBytes));
    }else{
      throw http.ClientException('Failed to add list');
    }
  }

  Future<ShoppingListModel> updateList(TokenModel token, int listId, String name, String color, String emoji, bool isActive) async {
    var url = Uri.parse('${baseUrl}shopping-lists/$listId/');
    var headers = {
      'Authorization': 'Token ${token.token}'
    };
    var body = {
      "name": name,
      "color": color,
      "emoji": emoji,
      "isActive": isActive.toString()
    };
    var response = await client.put(url, headers: headers, body: body);
    print(response.body);
    if(response.statusCode >= 200 && response.statusCode < 300){
      return ShoppingListModel.fromJson(utf8.decode(response.bodyBytes));
    }else{
      throw http.ClientException('Failed to update list');
    }
  }

  Future<ShoppingItemModel> updateItem(TokenModel token, int listId, int itemId,int productId,double quantity,Unit unit, bool isBought) async {
    var url = Uri.parse('${baseUrl}shopping-lists/$listId/items/$itemId/');
    var headers = {
      'Authorization': 'Token ${token.token}'
    };
    var body = {
      "product_id": productId.toString(),
      "quantity": quantity.toString(),
      "unit": unit.toString(),
      "isBought": isBought.toString()
    };
    var response = await client.put(url, headers: headers, body: body);
    print(response.body);
    if(response.statusCode >= 200 && response.statusCode < 300){
      return ShoppingItemModel.fromJson(utf8.decode(response.bodyBytes));
    }else{
      throw http.ClientException('Failed to add item');
    }
  }

  Future<ShoppingItemModel> addItem(TokenModel token, int listId, int productId, double quantity, Unit unit) async {
    var url = Uri.parse('${baseUrl}shopping-lists/$listId/items/');
    var headers = {
      'Authorization': 'Token ${token.token}'
    };
    var body = {
      "product_id": productId.toString(),
      "quantity": quantity.toString(),
      "unit": unit.toString(),
      "isBought": 'false'
    };
    var response = await client.post(url, headers: headers, body: body);
    print(response.body);
    if(response.statusCode >= 200 && response.statusCode < 300){
      return ShoppingItemModel.fromJson(utf8.decode(response.bodyBytes));
    }else{
      throw http.ClientException('Failed to add item');
    }
  }

  void dispose() {
    client.close();
  }
}