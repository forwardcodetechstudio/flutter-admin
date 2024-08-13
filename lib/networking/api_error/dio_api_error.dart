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
      case 422:
        if (response.data != null && response.data.containsKey('errors')) {
          Map<String, dynamic> errors = response.data['errors'];
          final List<String> errorMessage = [];
          if (errors.isNotEmpty) {
            errors.forEach((key, value) {
              if (value is List) {
                errorMessage.add(value[0]);
              } else {
                errorMessage.add(value.toString());
              }
            });
          }
          return errorMessage.join(", ");
        } else {
          return "An error occurred";
        }
      default:
        return "Received invalid status code: $statusCode";
    }
  } else {
    return "Received invalid response.";
  }
}

String handleBadResponse(Response response) {
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
      default:
        return "Received invalid status code: $statusCode";
    }
  } else {
    return "Received invalid response.";
  }
}
