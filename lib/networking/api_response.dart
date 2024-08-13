import 'package:flutter_admin/networking/api_error/api_error.dart';

class ApiResponse<T> {
  ApiResponse({this.data, this.error});
  T? data;

  ApiError? error;
}
