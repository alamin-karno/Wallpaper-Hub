import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../constants/constants.dart';

const _baseHeaders = {
  'Content-Type': 'application/json',
  'charset': 'utf-8',
};

class UnauthorizedRequestInterceptor extends QueuedInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(_baseHeaders);
    log('${options.method} >>> ${options.uri}', name: 'API');
    log('Query parameters: ${options.queryParameters}', name: 'API');
    log('Request data: ${options.data}', name: 'API');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      '${response.requestOptions.method} >>> ${response.requestOptions.uri}',
      name: 'API',
    );
    log('Response data: ${response.data}', name: 'API');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('${err.requestOptions.method} >>> ${err.requestOptions.uri}');
    log('Error data: ${err.response?.data}', name: 'API');
    super.onError(err, handler);
  }
}

class AuthorizedRequestInterceptor extends UnauthorizedRequestInterceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      options.headers[HttpHeaders.authorizationHeader] = AppConfig.apiKey;
      super.onRequest(options, handler);
    } on DioException catch (e) {
      log(e.toString(), name: 'API');
      handler.reject(e);
    } on Object catch (e) {
      log(e.toString(), name: 'API');
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('${err.requestOptions.method} >>> ${err.requestOptions.uri}');
    log('Error data: ${err.response?.data}', name: 'API');
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      // TODO: refresh token when access token expired
    } else {
      super.onError(err, handler);
    }
  }
}
