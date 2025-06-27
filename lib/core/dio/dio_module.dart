import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constants/constants.dart';
import 'dio_interceptor.dart';

@module
abstract class DioModule {
  @Named("Authorized")
  @singleton
  Dio getAuthorizedDioClient() {
    final dioClint = _dioClient();
    dioClint.interceptors.addAll([AuthorizedRequestInterceptor()]);
    return dioClint;
  }

  @Named('Unauthorized')
  @singleton
  Dio getUnauthorizedDioClient() {
    final dioClint = _dioClient();
    dioClint.interceptors.addAll([UnauthorizedRequestInterceptor()]);
    return dioClint;
  }

  Dio _dioClient() {
    final baseOptions = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: AppConstants.requestTimeoutAsSeconds,
      receiveTimeout: AppConstants.requestTimeoutAsSeconds,
    );

    return Dio(baseOptions);
  }
}
