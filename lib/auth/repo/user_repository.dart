
import 'package:solvro_basket_buddy/api/base_client.dart';
import 'package:solvro_basket_buddy/auth/model/loginModel.dart';


class UserRepository{
  static Future<void> login(String email, String password) async {
    var object = LoginModel(email: email, password: password);

    var response = await BaseClient().post('auth/login/', object).catchError((error) => print(error));

    if(response == null) return;
      print(response);
  }
}