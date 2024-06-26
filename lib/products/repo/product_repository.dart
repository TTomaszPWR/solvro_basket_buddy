import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:solvro_basket_buddy/api/base_url.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/products/model/product_model.dart';


class ProductRepository {
  var client = http.Client();

  Future<List<ProductModel>> fetch(TokenModel token) async {
    
    var url = Uri.parse('${baseUrl}products/');
    var headers = {
      'Authorization': 'Token ${token.token}'
    };

    var response = await client.get(url, headers: headers);

    if(response.statusCode >= 200 && response.statusCode < 300){
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<ProductModel> products = body.map((dynamic item) => ProductModel.fromMap(item)).toList();
      
      return products;
    }else{
      throw Exception('Failed to load products');
    }
  }


}