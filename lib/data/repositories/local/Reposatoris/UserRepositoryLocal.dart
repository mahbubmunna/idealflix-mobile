import 'package:smart_tv/data/Key/UserKey.dart';
import 'package:smart_tv/data/models/UserModel.dart';
import 'package:smart_tv/data/repositories/local/data_sources/localDataSources.dart';
import 'package:smart_tv/domain/entities/EntitiesExport.dart';
import 'package:sqflite/sqflite.dart';

class UserRepositoryLocal {
  Database _database = LocalDatabase.instance.database;

  Future<bool> createUser(UserModel user) async {
    await _database.insert(
      USER_TABLE,
      {
        UserKey.Name: user.name,
        UserKey.Email: user.email,
        UserKey.Password: user.password,
        UserKey.Token: user.token,
        UserKey.Avatar: user.avatar
      },
    ).then((value) {
      if (value != -1) {
        return true;
      } else {
        return false;
      }
    });
  }

  Future<bool> updateToken(UserModel user) async {
    await _database
        .update(USER_TABLE, {UserKey.Token: user.token}).then((value) {
      if (value != -1) {
        return true;
      } else {
        return false;
      }
    });
  }

  Future<bool> updateUser(UserModel user) async {
    await _database.update(USER_TABLE, {
      UserKey.Name: user.name,
      UserKey.Email: user.email,
      UserKey.Password: user.password,
      UserKey.Token: user.token,
      UserKey.Avatar: user.avatar
    });
  }

  Future<bool> deleteUser() {
    _database.delete(USER_TABLE).then((value) {
      if (value != 1) {
        return true;
      } else {
        return false;
      }
    });
  }

  Future<String> getToken() async {
    var data;
    await _database
        .rawQuery('SELECT ${UserKey.Token} FROM $USER_TABLE')
        .then((value) {
      // print("The Token is  ${value[0]}");

      if (value[0][UserKey.Token] != null) {
        data = value[0][UserKey.Token];
      } else {
        data = null;
      }
    }).catchError((err) {
      //print("Error  :: ${err}");

      data = null;
    });

    return data;
  }

  Future<bool> isMember() async {
    var data;
    await _database
        .rawQuery('SELECT ${UserKey.IsMember} FROM $USER_TABLE')
        .then((value) {
      print("The memeber value  ${value}");
      if (value.isEmpty) {
        data = false;
      } else {
        if (value[0] == 1) {
          data = true;
        } else {
          data = false;
        }
      }
    });

    return data;
  }

  Future<bool> updateMemberShip(bool isMember) async {
    await _database
        .update(USER_TABLE, {UserKey.IsMember: isMember ? 1 : 0}).then((value) {
      if (value != -1) {
        return true;
      } else {
        return false;
      }
    });
  }

  void clearTable(String tableName) async {
    await _database.delete(tableName);
  }
}
