import 'package:solvro_basket_buddy/auth/model/user_model.dart';

class TokenModel{
  final String? expiry;
  final String token;
  final UserModel user;

  TokenModel({
    required this.expiry, 
    required this.token, 
    required this.user
  });

  factory TokenModel.fromJson(Map<String, dynamic> json){
    return TokenModel(
      expiry: json['expiry'],
      token: json['token'],
      user: UserModel.fromJson(json['user'])
    );
  }

  Map<String, dynamic> toJson() => {
    'expiry': expiry,
    'token': token,
    'user': user.toJson()
  };

  @override
  String toString() => 'TokenModel(expiry: $expiry, token: $token, user: $user)';

  @override
  bool operator ==(covariant TokenModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.expiry == expiry &&
      other.token == token &&
      other.user == user;
  }

  @override
  int get hashCode => expiry.hashCode ^ token.hashCode ^ user.hashCode;
}