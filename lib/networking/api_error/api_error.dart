abstract class ApiError {
  ApiError({required String message, this.exception});

  Exception? exception;
  String? get errorMsg;
}
