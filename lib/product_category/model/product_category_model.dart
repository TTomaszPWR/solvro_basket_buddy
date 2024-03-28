// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductCategoryModel {
  final int id;
  final String name;
  
  ProductCategoryModel({
    required this.id,
    required this.name,
  });


  ProductCategoryModel copyWith({
    int? id,
    String? name,
  }) {
    return ProductCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory ProductCategoryModel.fromMap(Map<String, dynamic> map) {
    return ProductCategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategoryModel.fromJson(String source) => ProductCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductCategoryModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant ProductCategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
