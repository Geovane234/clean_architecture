import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

import '../../../models/response.dart';
import '../../exception/http_exception.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
  Future<Either<AppException, Response>> put(
    String endpoint, {
    Map<String, dynamic>? data,
  });
  Future<Either<AppException, Response>> delete(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}