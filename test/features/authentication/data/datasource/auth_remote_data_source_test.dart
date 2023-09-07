import 'package:clean_architecture/core/models/response.dart';
import 'package:clean_architecture/core/services/exception/http_exception.dart';
import 'package:clean_architecture/core/services/networking/dio_request/network_service.dart';
import 'package:clean_architecture/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/fixtures/dummy_data.dart';

void main() {
  late MockNetworkService mockNetworkService;
  late LoginUserRemoteDataSource loginUserRemoteDataSource;
  setUpAll(
    () {
      mockNetworkService = MockNetworkService();
      loginUserRemoteDataSource = LoginUserRemoteDataSource(mockNetworkService);
    },
  );
  group(
    'Authentication Remote DataSource Test\n',
    () {
      test(
        'login user returns UserModel on success',
        () async {
          // arrange
          when(() => mockNetworkService.post(any(), data: any(named: 'data')))
              .thenAnswer(
            (_) async => Right<AppException, Response>(
              Response(statusCode: 200, data: ktestUserFromMap.toJson()),
            ),
          );
          // act
          final response =
              await loginUserRemoteDataSource.loginUser(user: ktestUserFromMap);

          // assert
          expect(response.isRight(), true);
        },
      );
      test(
        'login user returns AppException on failure',
        () async {
          when(
            () => mockNetworkService.post(any(), data: any(named: 'data')),
          ).thenAnswer(
            (_) async => Left(ktestAppException),
          );

          final response =
              await loginUserRemoteDataSource.loginUser(user: ktestUser);

          expect(response.isLeft(), true);
        },
      );
      test(
        'login user returns AppException on exceptions',
        () async {
          when(
            () => mockNetworkService.post(any(), data: any(named: 'data')),
          ).thenThrow(
            (_) => Exception(),
          );

          final response =
              await loginUserRemoteDataSource.loginUser(user: ktestUser);

          expect(response.isLeft(), true);
        },
      );
    },
  );
}

class MockNetworkService extends Mock implements NetworkService {}
