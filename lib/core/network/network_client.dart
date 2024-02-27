import 'package:dio/dio.dart';
import 'package:flutter_admin/core/resources/app_storage.dart';
import 'package:get_it/get_it.dart';

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
      onRequest: (options, handler) async {
        final String? accessToken =
            await GetIt.I<AppStorage>().getAccessToken();
        if (accessToken != null) {
          options.headers.addAll({
            "Authorization": "Bearer $accessToken",
          });
        }
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
