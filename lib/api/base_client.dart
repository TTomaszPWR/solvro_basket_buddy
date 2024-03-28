import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'https://basket-buddy-solvro-api.kowalinski.dev/api/v1/';

class BaseClient{
  /*var client = http.Client();

  Future<dynamic> get(String api, String token) async {
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': 'Token $token'
    };
    var response = await client.get(url, headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }else{
      //throw Exception('Failed to get data');
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var payload = jsonEncode(object);
    var headers = {
      'Content-Type': 'application/json'
    };
    var response = await client.post(url, headers: headers, body: payload);
    if(response.statusCode >= 200 && response.statusCode < 300){
      return response.body;
    }else{
      //throw Exception('Failed to post data');
    }
  }

  Future<dynamic> put(String api) async {}

  Future<dynamic> delete(String api) async {}*/
}