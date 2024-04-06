import 'dart:developer';

import 'package:dio/dio.dart';

class DioApiError {
  final DioException e;
  DioApiError(this.e);

  String get errorMessage => _getErrorText();

  String _getErrorText() {
    if (e.type == DioExceptionType.badResponse && e.response != null) {
      int? statusCode = e.response?.statusCode;
      if (statusCode != null) {
        switch (statusCode) {
          case 400:
            return "Bad request.";
          case 401:
            return "Unauthorized.";
          case 403:
            return "Forbidden.";
          case 404:
            return "Not found.";
          // Add more cases as needed
          default:
            return "Received invalid status code: $statusCode";
        }
      } else {
        return "Received invalid response.";
      }
    } else {
      if (e.type == DioExceptionType.connectionTimeout) {
        return "Connection timeout occurred.";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return "Receive timeout in connection with server.";
      } else if (e.type == DioExceptionType.sendTimeout) {
        return "Send timeout in connection with server.";
      } else if (e.type == DioExceptionType.cancel) {
        return "Request was cancelled.";
      } else {
        return "Connection failed due to internet connection.";
      }
    }
  }
}
