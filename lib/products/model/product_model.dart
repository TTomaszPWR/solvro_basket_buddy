// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:solvro_basket_buddy/product_category/model/product_category_model.dart';

class ProductModel {
  int id;
  ProductCategoryModel category;
  String name;
  ProductModel({
    required this.id,
    required this.category,
    required this.name,
  });

  ProductModel copyWith({
    int? id,
    ProductCategoryModel? category,
    String? name,
  }) {
    return ProductModel(
      id: id ?? this.id,
      category: category ?? this.category,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category.toMap(),
      'name': name,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      category: ProductCategoryModel.fromMap(map['category'] as Map<String,dynamic>),
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductModel(id: $id, category: $category, name: $name)';

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.category == category &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ category.hashCode ^ name.hashCode;
}
