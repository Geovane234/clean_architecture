import 'package:dartz/dartz.dart';
import '../../../../core/services/exception/http_exception.dart';
import '../../../../core/services/networking/dio_request/network_service.dart';
import '../../../../core/shared/globals.dart';
import '../../models/pagination_response.dart';

abstract class DashboardDatasource {
  Future<Either<AppException, PaginatedResponse>> fetchPaginatedProducts(
      {required int skip});
  Future<Either<AppException, PaginatedResponse>> searchPaginatedProducts(
      {required int skip, required String query});
}

class DashboardRemoteDatasource extends DashboardDatasource {
  final NetworkService networkService;
  DashboardRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchPaginatedProducts(
      {required int skip}) async {
    final response = await networkService.get(
      '/products',
      queryParameters: {
        'skip': skip,
        'limit': PRODUCTS_PER_PAGE,
      },
    );

    return response.fold(
      (l) => Left(l),
      (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchPaginatedData',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }
        final paginatedResponse =
            PaginatedResponse.fromJson(jsonData, jsonData['products'] ?? []);
        return Right(paginatedResponse);
      },
    );
  }

  @override
  Future<Either<AppException, PaginatedResponse>> searchPaginatedProducts(
      {required int skip, required String query}) async {
    final response = await networkService.get(
      '/products/search?q=$query',
      queryParameters: {
        'skip': skip,
        'limit': PRODUCTS_PER_PAGE,
      },
    );

    return response.fold(
      (l) => Left(l),
      (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'search PaginatedData',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }
        final paginatedResponse =
            PaginatedResponse.fromJson(jsonData, jsonData['products'] ?? []);
        return Right(paginatedResponse);
      },
    );
  }
}
