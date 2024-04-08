import 'package:dio/dio.dart';

class DioBasicError {
  final DioException e;
  DioBasicError(this.e);

  String get errorMessage => _handleGenericError(e.type);

  String _handleGenericError(DioExceptionType type) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout occurred.";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout in connection with server.";
      case DioExceptionType.sendTimeout:
        return "Send timeout in connection with server.";
      case DioExceptionType.cancel:
        return "Request was cancelled.";
      default:
        return "Connection failed due to internet connection.";
    }
  }
}

String handleAuthBadResponse(Response response) {
  int? statusCode = response.statusCode;
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
}
