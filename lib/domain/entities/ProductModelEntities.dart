import 'package:flutter/cupertino.dart';

abstract class Product {
  final String id;
  final String name;
  final String type;
  final String shop;
  final String price;
  final String rating;
  final List images;

  Product({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.shop,
    @required this.price,
    @required this.rating,
    @required this.images,
  });
}
