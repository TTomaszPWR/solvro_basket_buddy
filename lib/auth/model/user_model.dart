class UserModel{
  final int id;
  final String email;

  UserModel({
    required this.id, 
    required this.email
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['id'],
      email: json['email']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email
  };

  @override
  String toString() => 'UserModel(id: $id, email: $email)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode;
}