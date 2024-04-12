
import 'dart:convert';

import 'package:solvro_basket_buddy/api/base_url.dart';
import 'package:solvro_basket_buddy/auth/model/auth_model.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:http/http.dart' as http;
import 'package:solvro_basket_buddy/auth/model/wrong_credentials_exception.dart';

class UserRepository{
  var client = http.Client();

  Future<TokenModel> login(String email, String password) async {
    var url = Uri.parse('${baseUrl}auth/login/');
    var body = AuthModel(email: email, password: password).toJson();
    
    var response = await client.post(url, body: body);
    if(response.statusCode >= 200 && response.statusCode < 300){
      var token = TokenModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      print(token.toString());
      return token;
    }else{
      throw WrongCredentialsException();
    }
  }

  Future<TokenModel> register(String email, String password) async {
    var url = Uri.parse('${baseUrl}auth/signup/');
    var body = {
      'email': email,
      'password': password
    };
    var response = await client.post(url, body: body);
    if(response.statusCode >= 200 && response.statusCode < 300){
      var token = TokenModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      print(token.toString());
      return token;
    }else{
      throw WrongCredentialsException();
    }
  }

  Future<void> logout(TokenModel token) async {
    var url = Uri.parse('${baseUrl}auth/logout/');
    var headers = {
      'Authorization': 'Token ${token.token}'
    };
    var response = await client.post(url, headers: headers);
    if(response.statusCode >= 200 && response.statusCode < 300){
      return ;
    }else{
      throw Exception('Failed to post data');
    }
  }
}