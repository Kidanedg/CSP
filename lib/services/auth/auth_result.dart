class AuthResult<T> {
  final bool success;
  final String? message;
  final T? data;

  const AuthResult({
    required this.success,
    this.message,
    this.data,
  });

  factory AuthResult.success({
    T? data,
    String? message,
  }) {
    return AuthResult<T>(
      success: true,
      data: data,
      message: message,
    );
  }

  factory AuthResult.failure(String message) {
    return AuthResult<T>(
      success: false,
      message: message,
    );
  }

  @override
  String toString() {
    return 'AuthResult(success: $success, message: $message, data: $data)';
  }
}
