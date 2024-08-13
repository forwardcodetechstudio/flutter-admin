import 'package:dio/dio.dart';
import 'package:flutter_admin/base/base_service.dart';

abstract class ApiService extends BaseService {
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
  });
  Future<Response<dynamic>> post(
    String url, {
    Object? data,
    Map<String, dynamic>? headers,
  });
  Future<Response<dynamic>> put(
    String url, {
    Object? data,
    Map<String, dynamic>? headers,
  });
  Future<Response<dynamic>> delete(
    String url, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
  });
}
