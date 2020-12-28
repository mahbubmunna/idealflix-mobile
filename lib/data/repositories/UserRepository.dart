import 'package:dartz/dartz.dart';
import 'package:smart_tv/core/error/AppError.dart';
import 'package:smart_tv/data/repositories/local/Reposatoris/UserRepositoryLocal.dart';

abstract class UserRepository {
  Future<Either<AppError, String>> getToken();

  Future<Either<AppError, bool>> isMember();

  clearTable(String tableName);
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryLocal _userRepositoryLocal = new UserRepositoryLocal();

  @override
  Future<Either<AppError, String>> getToken() async {
    // TODO: implement getToken
    // throw UnimplementedError();

    var token = await _userRepositoryLocal.getToken();

    if (token != null) {
      return Right(token);
    } else {
      return Left(
          AppError(isNull: true, errorMessage: "Token is not available"));
    }
  }

  @override
  Future<Either<AppError, bool>> isMember() async {
    // TODO: implement isMember
    //throw UnimplementedError();

    var _isMember = await _userRepositoryLocal.isMember();

    if (_isMember != null) {
      return Right(_isMember);
    } else {
      return Left(AppError(errorMessage: "User not subscribed"));
    }
  }

  @override
  clearTable(String tableName) {
    // TODO: implement clearTable
    _userRepositoryLocal.clearTable(tableName);
  }
}
