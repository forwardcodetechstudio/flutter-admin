import 'package:dio/dio.dart';

class NetworkClient {
  late Dio _client;
  static const String baseUrl = 'https://dev.anbocas.com';

  NetworkClient() {
    _client = Dio();
    _client.options = _options();
    _client.interceptors.add(interceptorsWrapper());
    _client.interceptors.add(_logInterseptor());
  }

  InterceptorsWrapper interceptorsWrapper() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.addAll({
          "Authorization": "Bearer 34|uoIuvD1GV7YULJUdLHjYvtJ7pSU3972kXjJj6hWH121a11ae",
        });
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        return handler.next(error);
      },
    );
  }

  LogInterceptor _logInterseptor() {
    return LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
    );
  }

  BaseOptions _options() {
    return BaseOptions(
      responseType: ResponseType.json,
      baseUrl: baseUrl,
    );
  }

  Dio get client => _client;
}
