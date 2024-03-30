import 'package:http/http.dart' as http;
import 'package:solvro_basket_buddy/api/base_client.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/shopping_list_item_model.dart';

class ShoppingListsRepository {
  var client = http.Client();

  Future<List<ShoppingItemModel>> fetch(TokenModel token) async {
    var url = Uri.parse('${baseUrl}shopping-lists/');
    var headers = {
      'Authorization': 'Token ${token.token}'
    };
    var response = await client.get(url, headers: headers);

    return (response.statusCode >= 200 && response.statusCode < 300)
        ? (response.body as List<dynamic>).map((e) => ShoppingItemModel.fromMap(e)).toList()
        : throw Exception('Failed to load shopping lists');
  }

}