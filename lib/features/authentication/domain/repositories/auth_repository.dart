import 'package:dartz/dartz.dart';

import '../../../../core/services/exception/http_exception.dart';
import '../../../dashboard/models/user/user_model.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, User>> loginUser({required User user});
}
