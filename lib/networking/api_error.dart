import 'package:dio/dio.dart';
import 'package:flutter_admin/networking/dio_api_error.dart';

class ApiError {
  ApiError({this.e, String message = "Something went wrong."}) {
    _message = message;
  }

  Exception? e;
  late String _message;

  String get errorMsg => _getErrorText();

  String _getErrorText() {
    if (e != null) {
      if (e is DioException) {
        var dioException = e as DioException;
        return DioApiError(dioException).errorMessage;
      } else {
        return "An unexpected error occurred: ${e.toString()}";
      }
    } else {
      return _message;
    }
  }
}
