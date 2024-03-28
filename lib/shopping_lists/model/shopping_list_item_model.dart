// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:solvro_basket_buddy/products/model/product_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/unitEnum.dart';

class ListItemModel {
  int id;
  ProductModel product;
  int productId;
  int quantity;
  Unit unit;
  bool isBought;

  
  ListItemModel({
    required this.id,
    required this.product,
    required this.productId,
    required this.quantity,
    required this.unit,
    required this.isBought,
  });


  ListItemModel copyWith({
    int? id,
    ProductModel? product,
    int? productId,
    int? quantity,
    Unit? unit,
    bool? isBought,
  }) {
    return ListItemModel(
      id: id ?? this.id,
      product: product ?? this.product,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      isBought: isBought ?? this.isBought,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product.toMap(),
      'productId': productId,
      'quantity': quantity,
      'unit': unit.toMap(),
      'isBought': isBought,
    };
  }

  factory ListItemModel.fromMap(Map<String, dynamic> map) {
    return ListItemModel(
      id: map['id'] as int,
      product: ProductModel.fromMap(map['product'] as Map<String,dynamic>),
      productId: map['productId'] as int,
      quantity: map['quantity'] as int,
      unit: Unit.fromMap(map['unit'] as Map<String,dynamic>),
      isBought: map['isBought'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListItemModel.fromJson(String source) => ListItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ListItemModel(id: $id, product: $product, productId: $productId, quantity: $quantity, unit: $unit, isBought: $isBought)';
  }

  @override
  bool operator ==(covariant ListItemModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.product == product &&
      other.productId == productId &&
      other.quantity == quantity &&
      other.unit == unit &&
      other.isBought == isBought;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      product.hashCode ^
      productId.hashCode ^
      quantity.hashCode ^
      unit.hashCode ^
      isBought.hashCode;
  }
}
