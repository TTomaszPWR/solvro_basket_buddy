// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';

import 'package:solvro_basket_buddy/shopping_lists/model/shopping_list_item_model.dart';

class ShoppingListModel {
  int id;
  List<ShoppingItemModel> items;
  String name;
  String color;
  String emoji;
  bool isActive;
  int owner;
  ShoppingListModel({
    required this.id,
    required this.items,
    required this.name,
    required this.color,
    required this.emoji,
    required this.isActive,
    required this.owner,
  });
 

  ShoppingListModel copyWith({
    int? id,
    List<ShoppingItemModel>? items,
    String? name,
    String? color,
    String? emoji,
    bool? isActive,
    int? owner,
  }) {
    return ShoppingListModel(
      id: id ?? this.id,
      items: items ?? this.items,
      name: name ?? this.name,
      color: color ?? this.color,
      emoji: emoji ?? this.emoji,
      isActive: isActive ?? this.isActive,
      owner: owner ?? this.owner,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'items': items.map((x) => x.toMap()).toList(),
      'name': name,
      'color': color,
      'emoji': emoji,
      'isActive': isActive,
      'owner': owner,
    };
  }

  factory ShoppingListModel.fromMap(Map<String, dynamic> map) {
    return ShoppingListModel(
      id: map['id'] as int,
      items: List<ShoppingItemModel>.from((map['items'] as List<dynamic>).map<ShoppingItemModel>((x) => ShoppingItemModel.fromMap(x as Map<String,dynamic>),),),
      name: map['name'] as String,
      color: map['color'] as String,
      emoji: map['emoji'] as String,
      isActive: map['isActive'] as bool,
      owner: map['owner'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoppingListModel.fromJson(String source) => ShoppingListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShoppingListModel(id: $id, items: $items, name: $name, color: $color, emoji: $emoji, isActive: $isActive, owner: $owner)';
  }

  @override
  bool operator ==(covariant ShoppingListModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      listEquals(other.items, items) &&
      other.name == name &&
      other.color == color &&
      other.emoji == emoji &&
      other.isActive == isActive &&
      other.owner == owner;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      items.hashCode ^
      name.hashCode ^
      color.hashCode ^
      emoji.hashCode ^
      isActive.hashCode ^
      owner.hashCode;
  }

  int _calcBoughtItems() {
    int bought = 0;
    items.forEach((element) {
      if (element.isBought) {
        bought++;
      }
    });
    return bought;
  }
  
  double calcBoughtRatio() {
    if (items.isEmpty) {
      return 0;
    }else{
      double ratio = _calcBoughtItems() / items.length;
      return ratio;
    }
  }

  String getProgress(){
    return '${_calcBoughtItems()}/${items.length}';
  }
}
