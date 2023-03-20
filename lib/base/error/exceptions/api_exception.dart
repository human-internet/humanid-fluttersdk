class ApiException implements Exception {
  final String message;
  String errorCode = '';

  ApiException(this.message, this.errorCode);
}
