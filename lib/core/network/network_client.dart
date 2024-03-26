import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkClient {
  late Dio _client;
  static const String baseUrl = 'https://5b2c-2405-201-a005-e0e4-699f-2969-f58-4812.ngrok-free.app';

  NetworkClient() {
    _client = Dio();
    _client.options = _options();
    _client.interceptors.add(interceptorsWrapper());
    _client.interceptors.add(_logInterseptor());
  }

  InterceptorsWrapper interceptorsWrapper() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final SharedPreferences sharedPreferences =
            GetIt.I<SharedPreferences>();
        final String? accessToken = sharedPreferences.getString('accessToken');
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
