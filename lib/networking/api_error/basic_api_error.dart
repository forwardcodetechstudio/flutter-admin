import 'package:dio/dio.dart';
import 'package:flutter_admin/networking/api_error/api_error.dart';
import 'package:flutter_admin/networking/api_error/dio_api_error.dart';

class BasicApiError implements ApiError {
  BasicApiError({String message = "Something went wrong.", Exception? e}) {
    _message = message;
    exception = e;
  }

  late String _message;

  @override
  Exception? exception;

  @override
  String? get errorMsg => throw _getErrorText();

  String _getErrorText() {
    if (exception != null) {
      if (exception is DioException) {
        var dioException = exception as DioException;
        if (dioException.type == DioExceptionType.badResponse &&
            dioException.response != null) {
          return handleBadResponse(dioException.response!);
        } else {
          return DioBasicError(dioException).errorMessage;
        }
      } else {
        return "An unexpected error occurred: ${exception.toString()}";
      }
    } else {
      return _message;
    }
  }
}
