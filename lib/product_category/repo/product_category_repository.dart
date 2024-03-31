import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:solvro_basket_buddy/api/base_client.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/product_category/model/product_category_model.dart';

class ProductCategoryRepository {
  var client = http.Client();

  Future<List<ProductCategoryModel>> fetch(TokenModel token) async {
    var url = Uri.parse('${baseUrl}product-categories/');
    var headers = {
      'Authorization': 'Token ${token.token}'
    };

    var response = await client.get(url, headers: headers);



    if(response.statusCode >= 200 && response.statusCode < 300){
      List<dynamic> body = jsonDecode(response.body);
      List<ProductCategoryModel> productCategories = body.map((dynamic item) => ProductCategoryModel.fromMap(item)).toList();
      
      productCategories.forEach((element) {
        print(element.name);
      });
      return productCategories;
    }else{
      throw Exception('Failed to load product categories');
    }

  }
}