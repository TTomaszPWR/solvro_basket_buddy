import 'package:solvro_basket_buddy/auth/model/user.dart';

class Token{
  final String? expiry;
  final String token;
  final User user;

  Token({
    required this.expiry, 
    required this.token, 
    required this.user
  });

  factory Token.fromJson(Map<String, dynamic> json){
    return Token(
      expiry: json['expiry'],
      token: json['token'],
      user: User.fromJson(json['user'])
    );
  }

  Map<String, dynamic> toJson() => {
    'expiry': expiry,
    'token': token,
    'user': user.toJson()
  };
}