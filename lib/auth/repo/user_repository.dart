
import 'dart:convert';

import 'package:solvro_basket_buddy/api/base_client.dart';
import 'package:solvro_basket_buddy/auth/model/auth_model.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';


class UserRepository{
  static Future<TokenModel> login(String email, String password) async {
    var object = AuthModel(email: email, password: password);

    var response = await BaseClient().post('auth/login/', object).catchError((error) => print(error));

    var token = TokenModel.fromJson(json.decode(response));

    return token;
  }

  static Future<TokenModel> register(String email, String password) async {
    var object = AuthModel(email: email, password: password);

    var response = await BaseClient().post('auth/signup/', object).catchError((error) => print(error));

    return TokenModel.fromJson(json.decode(response));
  }


}