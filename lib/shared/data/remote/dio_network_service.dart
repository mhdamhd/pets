import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pets/configs/app_configs.dart';
import 'package:pets/shared/data/remote/network_service.dart';
import 'package:pets/shared/domain/models/either.dart';
import 'package:pets/shared/domain/models/response.dart' as response;
import 'package:pets/shared/exceptions/http_exception.dart';
import 'package:pets/shared/globals.dart';
import 'package:pets/shared/mixins/exception_handler_mixin.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;
  DioNetworkService(this.dio) {
    // this throws error while running test
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: AppConfigs.baseUrl,
      );

  @override
  Future<Either<AppException, response.Response>> post(String endpoint,
      {Map<String, dynamic>? data, Map<String, String>? headers}) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
        options: Options(headers: headers ?? AppConfigs.baseHeaders)
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<response.Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters, Map<String, String>? headers}) {
    final res = exceptionThrower(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers ?? AppConfigs.baseHeaders)
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
