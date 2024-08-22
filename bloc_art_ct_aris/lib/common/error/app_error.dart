
enum AppErrorType {
  network,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown
}

class AppError {
  late AppErrorType type;
  late Exception exception;

  AppError(Exception ex) {
    exception = ex;
    type = AppErrorType.unknown;
  }

  String getErrorMsg() {
    return (exception as APIException).message;
  }
}

class APIException implements Exception {
  final int code;
  final String message;

  APIException(this.code, this.message);
}