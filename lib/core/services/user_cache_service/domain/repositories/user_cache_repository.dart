import 'package:dartz/dartz.dart';

import '../../../../../features/dashboard/models/user/user_model.dart';
import '../../../exception/http_exception.dart';

abstract class UserRepository {
  Future<Either<AppException, User>> fetchUser();
  Future<bool> saveUser({required User user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}
