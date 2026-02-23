class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(this.message, {this.statusCode});

  bool get isNetworkError =>
      message.contains('No internet') || message.contains('timeout');

  bool get isAuthError => statusCode == 401 || statusCode == 403;

  @override
  String toString() => message;
}
