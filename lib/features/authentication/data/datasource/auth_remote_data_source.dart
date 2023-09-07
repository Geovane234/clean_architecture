import 'package:dartz/dartz.dart';

import '../../../../core/services/exception/http_exception.dart';
import '../../../../core/services/networking/dio_request/network_service.dart';
import '../../../dashboard/models/user/user_model.dart';

abstract class LoginUserDataSource {
  Future<Either<AppException, User>> loginUser({required User user});
}

class LoginUserRemoteDataSource implements LoginUserDataSource {
  final NetworkService networkService;

  LoginUserRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, User>> loginUser({required User user}) async {
    try {
      final eitherType = await networkService.post(
        '/auth/login',
        data: user.toJson(),
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          final user = User.fromJson(response.data);
          print("====user data $user");
          // update the token for requests
          networkService.updateHeader(
            {'Authorization': user.token},
          );

          return Right(user);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }
}
