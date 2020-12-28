import 'package:flutter/foundation.dart';

abstract class User {
  String name;
  String email;
  String password;
  String token;
  String avatar;
  bool isMember;

  User(
      {@required this.name,
      @required this.email,
      @required this.password,
      @required this.token,
      @required this.isMember,
      @required this.avatar});
}
