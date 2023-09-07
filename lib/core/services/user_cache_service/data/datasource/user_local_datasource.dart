import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../../features/dashboard/models/user/user_model.dart';
import '../../../../shared/data/local/storage_service.dart';
import '../../../../shared/globals.dart';
import '../../../exception/http_exception.dart';

abstract class UserDataSource {
  String get storageKey;

  Future<Either<AppException, User>> fetchUser();
  Future<bool> saveUser({required User user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}

class UserLocalDatasource extends UserDataSource {
  UserLocalDatasource(this.storageService);

  final StorageService storageService;

  @override
  String get storageKey => USER_LOCAL_STORAGE_KEY;

  @override
  Future<Either<AppException, User>> fetchUser() async {
    final data = await storageService.get(storageKey);
    if (data == null) {
      return Left(
        AppException(
          identifier: 'UserLocalDatasource',
          statusCode: 404,
          message: 'User not found',
        ),
      );
    }
    final userJson = jsonDecode(data.toString());
    print("=====data $userJson");

    return Right(User.fromJson(userJson));
  }

  @override
  Future<bool> saveUser({required User user}) async {
    return await storageService.set(storageKey, jsonEncode(user.toJson()));
  }

  @override
  Future<bool> deleteUser() async {
    return await storageService.remove(storageKey);
  }

  @override
  Future<bool> hasUser() async {
    return await storageService.has(storageKey);
  }
}
