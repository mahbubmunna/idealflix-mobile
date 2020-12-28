import 'dart:io';
import 'dart:core';
import 'package:path/path.dart';
import 'package:smart_tv/data/Key/UserKey.dart';
import 'package:sqflite/sqflite.dart';

String USER_TABLE = "user_table";

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase();

  String path;
  Database database;

/*  String PRODUCT_TABLE = "Product_table";
  String IMAGES_TABLE = "Images_table";
  String INITIAL_ID_TABLE = "Initial_id_table";*/

 Future initiate() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, 'localDatabase.db');

    if (await databaseExists(path)) {
      print("Database Already exists");
      database = await openDatabase(path);
    } else {
      database = await openDatabase(path, version: 2,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table
        /*     await db.execute(
            'CREATE TABLE $PRODUCT_TABLE (id TEXT, name TEXT, price TEXT, type TEXT, shop TEXT, rating TEXT)');
        await db.execute('CREATE TABLE $IMAGES_TABLE (id TEXT, src TEXT)');
        await db.execute('CREATE TABLE $INITIAL_ID_TABLE (id TEXT)');*/
        await db
            .execute(
                'CREATE TABLE $USER_TABLE (${UserKey.Name} TEXT, ${UserKey.Email} TEXT, ${UserKey.Password} TEXT, ${UserKey.Token} TEXT, ${UserKey.Avatar} TEXT, ${UserKey.IsMember} INTEGER)')
            .then((value) {
          print(" created database ");
        }).catchError((err) {
          print("The error is ${err}");
        });
      });
    }
  }

  deleteLocalDatabase() {
    deleteDatabase(path);
  }
}
