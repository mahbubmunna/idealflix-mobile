
import 'package:smart_tv/data/models/ProductRepositoryModel.dart';
import 'package:smart_tv/data/repositories/local/data_sources/localDataSources.dart';
import 'package:smart_tv/domain/entities/ProductModelEntities.dart';
import 'package:sqflite/sqflite.dart';

class ProductRepositoryLocal {
  Database database = LocalDatabase.instance.database;

  String PRODUCT_TABLE = "Product_table";
  String IMAGES_TABLE = "Images_table";
  String INITIAL_ID_TABLE = "Initial_id_table";

  Future<List> getImages(String id) async {
    var images = await database.rawQuery(
      "SELECT * FROM $IMAGES_TABLE WHERE id = ?",
      [id],
    );
    var temp = [];
    images.forEach((element) {
      temp.add(element['src']);
    });
    return temp;
  }

  setImages({List images, String id}) async {
    try {
      images.forEach((element) async {
        await database
            .insert("$IMAGES_TABLE", {"id": "$id", "src": "$element"});
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  setInitialId({List id}) async {
    try {
      id.forEach((element) async {
        await database.insert("$IMAGES_TABLE", {"id": "$element"});
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  setProduct(Product product) async {
    try {
      await database.insert(
        "$PRODUCT_TABLE",
        {
          "id": product.id,
          "name": product.name,
          "price": product.price,
          "shop": product.shop,
          "type": product.type,
          "rating": product.rating,
        },
      );
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  clearProducts() async {
    await database.execute("DELETE FROM $PRODUCT_TABLE");
    print("Cleared Products ids from Local...");
  }

  clearImages() async {
    await database.execute("DELETE FROM $IMAGES_TABLE");
    print("Cleared Images ids from Local...");
  }

  clearInitialId() async {
    await database.execute("DELETE FROM $INITIAL_ID_TABLE");
    print("Cleared Images ids from Local...");
  }

  setProducts(List id) async {
    print(id);
    id.forEach((element) async {
      await database
          .rawInsert("INSERT INTO $INITIAL_ID_TABLE(id) VALUES(?)", [element]);
    });
  }

   getProducts() async {
    var alldata;
    List temp = [];
    try {
      alldata = await database.query("$INITIAL_ID_TABLE");
      alldata.forEach((element) {
        temp.add(element['id']);
      });
    } on Exception catch (e) {
      print(e.toString());
    }
    return temp.isEmpty ? null : temp;
  }

  Future<ProductRepositoryModel> getProductByID(String id) async {
    assert(id != null);
    var alldata = await database.query("$PRODUCT_TABLE");
    var result;
    bool elementExists = false;
    alldata.forEach((element) {
      if (element["id"] == id) {
        elementExists = true;
      }
    });
    if (elementExists) {
      try {
        result = await database
            .rawQuery("SELECT * FROM $PRODUCT_TABLE WHERE id = ?", [id]);
        var images = await getImages(id);
        print(images);
        if (result.isEmpty) {
          return null;
        } else {
          result = result.first;
          return ProductRepositoryModel(
            id: result['id'] ?? '',
            name: result['name'] ?? '',
            type: result['type'] ?? '',
            shop: result['shop'] ?? '',
            price: result['price'] ?? '',
            rating: result['rating'] ?? '',
            images: images ?? [],
          );
        }
      } on Exception catch (e) {
        print(e.toString());
        return null;
      }
    } else {
      return null;
    }
  }
}
