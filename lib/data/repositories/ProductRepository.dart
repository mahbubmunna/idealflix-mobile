

import 'package:smart_tv/data/models/ProductRepositoryModel.dart';
import 'package:smart_tv/data/repositories/local/Reposatoris/ProductRepositoryLocal.dart';
import 'package:smart_tv/data/repositories/remote/ProductAPI/ProductRepositoryRemote.dart';

class ProductRepository{
  getAllProducts() async {
    List<Map<String, dynamic>> result = await ProductRepositoryLocal().getProducts();
    List temp = [];
    if(result != null && result.isNotEmpty){
      result.forEach((element) {
        if (element['initialId'] != null) {
          temp.add(element['initialId']);
        }
      });
      return temp;
    }
    else{
    print("I am Inside The getAllProducts 3");
      var result = await ProductRepositoryRemote().getAllProducts();
      print(result);
      ProductRepositoryLocal().setProducts(result);
      print("Sending id from RemoteDatabase");
      return result;
    }
  }

  getProductByID(String id) async {
    assert(id != null);
    ProductRepositoryModel product = await ProductRepositoryLocal().getProductByID(id);
    if(product == null){
      product = await ProductRepositoryRemote().getProductByIdRemote(id);
      ProductRepositoryLocal().setProduct(product);
      ProductRepositoryLocal().setImages(images: product.images, id: product.id);
      print("Sending Product from RemoteDatabase");
      return product;
    }else{
      print("Sending Product from LocalDatabase");
      return product;
    }
  }
}