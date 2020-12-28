import 'package:flutter/material.dart';
import 'package:smart_tv/domain/entities/ProductModelEntities.dart';

class ProductRepositoryModel implements Product {
  final String id;
  final String name;
  final String type;
  final String shop;
  final String price;
  final String rating;
  final List images;


  factory ProductRepositoryModel.fromJson(Map<String, dynamic> json) {
    return ProductRepositoryModel(
      id: json["id"],
      name: json["name"],
      type: json["type"],
      shop: json["shop"],
      price: json["price"],
      rating: json["rating"],
      images: json["images"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "type": this.type,
      "shop": this.shop,
      "price": this.price,
      "rating": this.rating,
      "images": this.images,
    };
  }

  ProductRepositoryModel({
    @required this.images,
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.shop,
    @required this.price,
    @required this.rating,
  });
}
