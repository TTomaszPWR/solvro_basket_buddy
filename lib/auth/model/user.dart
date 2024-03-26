class User{
  final int id;
  final String email;

  User({
    required this.id, 
    required this.email
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      email: json['email']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email
  };
}