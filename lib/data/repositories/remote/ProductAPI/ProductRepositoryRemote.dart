import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smart_tv/data/models/ProductRepositoryModel.dart';

class ProductRepositoryRemote {
  getAllProducts() async {
    // var result = await http.get(RemoteDataSources.PRODUCT_API);
    String data = await rootBundle.loadString("assets/product-id.json");
    var result = await json.decode(data);
    List<String> temp = [];
    result['id'].forEach((element) {
      temp.add("${element.toString()}");
    });
    return temp;
  }

  getProductByIdRemote(String id) async {
    String data = await rootBundle.loadString("assets/products-json.json");
    var result = await json.decode(data);
    print("Printing images from remote ${result['products'][id]['images']}");
    return ProductRepositoryModel(
      name: result['products'][id]['name'],
      type: result['products'][id]['type'],
      id: result['products'][id]['id'],
      shop: result['products'][id]['shop'],
      rating: result['products'][id]['rating'],
      images: result['products'][id]['images'],
      price: result['products'][id]['price'],
    );
  }
}
