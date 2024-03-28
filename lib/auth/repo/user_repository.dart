
import 'dart:convert';

import 'package:solvro_basket_buddy/api/base_client.dart';
import 'package:solvro_basket_buddy/auth/model/auth_model.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:http/http.dart' as http;

class UserRepository{
  var client = http.Client();

  Future<TokenModel> login(String email, String password) async {
    var url = Uri.parse('${baseUrl}auth/login/');

    var authModel = AuthModel(email: email, password: password);
    var payload = jsonEncode(authModel);
    var headers = {
      'Content-Type': 'application/json'
    };

    var response = await client.post(url, headers: headers, body: payload);
    var token = TokenModel.fromJson(json.decode(response.body));
    return token;
  }

  Future<TokenModel> register(String email, String password) async {
    var url = Uri.parse('${baseUrl}auth/signup/');

    var authModel = AuthModel(email: email, password: password);
    var payload = jsonEncode(authModel);
    var headers = {
      'Content-Type': 'application/json'
    };

    var response = await client.post(url, headers: headers, body: payload);
    var token = TokenModel.fromJson(json.decode(response.body));
    print(token.toString());
    return token;
  }

  Future<void> logout(TokenModel token) async {
    var url = Uri.parse('${baseUrl}auth/logout/');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token ${token.token}'
    };
    var response = await client.post(url, headers: headers);
    if(response.statusCode >= 200 && response.statusCode < 300){
      return ;
    }else{
      //throw Exception('Failed to post data');
    }
  }
  
}