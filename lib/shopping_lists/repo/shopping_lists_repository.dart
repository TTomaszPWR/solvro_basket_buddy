import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:solvro_basket_buddy/api/base_client.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/shopping_list_item_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/shopping_list_model.dart';

class ShoppingListsRepository {
  var client = http.Client();

  Future<List<ShoppingListModel>> fetch(TokenModel token) async {
    var url = Uri.parse('${baseUrl}shopping-lists/');
    var headers = {
      'Authorization': 'Token ${token.token}'
    };
    var response = await client.get(url, headers: headers);

    print(response.body);

    
    if(response.statusCode >= 200 && response.statusCode < 300){
      List<dynamic> body = jsonDecode(response.body);
      List<ShoppingListModel> shoppingLists = body.map((dynamic item) => ShoppingListModel.fromMap(item)).toList();
      

      shoppingLists.forEach((element) {
        print(element.name);
      });

      return shoppingLists;
    }else{
      throw Exception('Failed to load shopping lists');
    }
  }

  Future<ShoppingItemModel> getItem(TokenModel token, int listId, int itemId,) async {
    var url = Uri.parse('${baseUrl}shopping-lists/$listId/items/$itemId/');
    var headers = {
      'Authorization': 'Token ${token.token}'
    };

    var response = await client.get(url, headers: headers);

    print(response.body);

    if(response.statusCode >= 200 && response.statusCode < 300){
      var body = jsonDecode(response.body);
      var item = ShoppingItemModel.fromMap(body);
      
      return item;
    }else{
      throw Exception('Failed to load item');
    }
  }
}