import 'package:dartz/dartz.dart';

import '../../../../core/services/exception/http_exception.dart';
import '../../models/pagination_response.dart';

abstract class DashboardRepository {
  Future<Either<AppException, PaginatedResponse>> fetchProducts(
      {required int skip});
  Future<Either<AppException, PaginatedResponse>> searchProducts(
      {required int skip, required String query});
}
