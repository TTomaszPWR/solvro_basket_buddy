import 'package:solvro_basket_buddy/auth/model/user.dart';

class Token{
  final String expiry;
  final String token;
  final User user;
  Token({required this.expiry, required this.token, required this.user});
}