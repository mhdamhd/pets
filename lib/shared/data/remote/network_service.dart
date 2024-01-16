import 'package:pets/shared/domain/models/either.dart';
import 'package:pets/shared/domain/models/response.dart';
import 'package:pets/shared/exceptions/http_exception.dart';

abstract class NetworkService {
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters, Map<String, String>? headers});

  Future<Either<AppException, Response>> post(String endpoint,
      {Map<String, dynamic>? data, Map<String, String>? headers});
}
