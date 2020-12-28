import 'package:smart_tv/data/Key/UserKey.dart';
import 'package:smart_tv/domain/entities/EntitiesExport.dart';

class UserModel implements User {
  @override
  String avatar;
  @override
  String email;
  @override
  String name;
  @override
  String password;
  @override
  String token;
  @override
  bool isMember;

  UserModel(
      {this.email,
      this.name,
      this.password,
      this.token,
      this.avatar,
      this.isMember});

  factory UserModel.fromJson(Map<String, dynamic> userJson) {
    return UserModel(
        isMember: userJson[UserKey.IsMember],
        email: userJson[UserKey.Email],
        name: userJson[UserKey.Name],
        password: userJson[UserKey.Password],
        token: userJson[UserKey.Token],
        avatar: userJson[UserKey.Avatar]);
  }

  Map<String, dynamic> toJson() {
    return {
      UserKey.IsMember: this.isMember,
      UserKey.Email: this.email,
      UserKey.Name: this.name,
      UserKey.Token: this.token,
      UserKey.Avatar: this.avatar,
      UserKey.Password: this.password
    };
  }
}
