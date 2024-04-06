import 'package:dio/dio.dart';
import 'package:flutter_admin/network/api_service.dart';
import 'package:flutter_admin/network/dio_api_client.dart';

class ApiServiceImpl implements ApiService {
  ApiServiceImpl(this.apiClient);

  final DioApiClient apiClient;

  @override
  Future<Response<dynamic>> delete(
    String url, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
  }) {
    return apiClient.delete(url, parameters: parameters, headers: headers);
  }

  @override
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
  }) {
    return apiClient.get(url, parameters: parameters, headers: headers);
  }

  @override
  Future<Response<dynamic>> post(
    String url, {
    Object? data,
    Map<String, dynamic>? headers,
  }) {
    return apiClient.post(url, data: data, headers: headers);
  }

  @override
  Future<Response<dynamic>> put(
    String url, {
    Object? data,
    Map<String, dynamic>? headers,
  }) {
    return apiClient.put(url, data: data, headers: headers);
  }
}
