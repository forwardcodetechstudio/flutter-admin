import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_admin/core/utils/pref_utils.dart';
import 'package:flutter_admin/di/di_injector.dart';
import 'base_api_client.dart';

class DioApiClient extends BaseApiClient {
  late Dio dio;

  @override
  void initialize() {
    _initDio();
  }

  void _initDio() {
    dio = Dio();
    _setupInterceptors();
  }

  void _setupInterceptors() {
    dio.interceptors.add(_interceptor());
    dio.interceptors.add(_logInterceptor());
    dio.options = _options();
  }

  Interceptor _interceptor() {
    return InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      final String accessToken = prefUtils.getStringIn(SharedPrefKeys.token);
      if (accessToken.isNotEmpty) {
        options.headers.addAll({
          "Authorization": "Bearer $accessToken",
        });
      }
      return handler.next(options);
    }, onError: (DioException e, handler) {
      return handler.next(e);
    }, onResponse: (Response e, ResponseInterceptorHandler handler) {
      log(e.data.toString());
      return handler.next(e);
    });
  }

  LogInterceptor _logInterceptor() {
    return LogInterceptor(
        requestBody: true, responseBody: true, requestHeader: true);
  }

  BaseOptions _options() {
    return BaseOptions(
        responseType: ResponseType.json, baseUrl: "https://dev.anbocas.com");
  }

  @override
  Future<Response<dynamic>> delete(
    String url, {
    Map<String, dynamic>? parameters,
    Map<String?, dynamic>? headers,
  }) {
    // adding runtime headers
    headers?.forEach((key, value) {
      dio.options.headers.putIfAbsent(key!, () => value);
    });

    return dio.delete(url);
  }

  @override
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? parameters,
    Map<String?, dynamic>? headers,
  }) {
    // adding runtime headers
    headers?.forEach((key, value) {
      dio.options.headers.putIfAbsent(key!, () => value);
    });

    return dio.get(
      url,
      queryParameters: parameters,
    );
  }

  @override
  Future<Response<dynamic>> post(
    String url, {
    Object? data,
    Map<String?, dynamic>? headers,
  }) {
    // adding runtime headers
    headers?.forEach((key, value) {
      dio.options.headers.putIfAbsent(key!, () => value);
    });

    return dio.post(url, data: data);
  }

  @override
  Future<Response<dynamic>> put(
    String url, {
    Object? data,
    Map<String?, dynamic>? headers,
  }) {
    // adding runtime headers
    headers?.forEach((key, value) {
      dio.options.headers.putIfAbsent(key!, () => value);
    });
    return dio.put(url, data: data);
  }
}
