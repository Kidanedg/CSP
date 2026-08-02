class AuthException implements Exception {
  final String message;

  const AuthException(this.message);

  @override
  String toString() => message;
}

class InvalidCredentialsException extends AuthException {
  const InvalidCredentialsException()
      : super('Invalid email or password.');
}

class UserNotFoundException extends AuthException {
  const UserNotFoundException()
      : super('User not found.');
}

class EmailAlreadyInUseException extends AuthException {
  const EmailAlreadyInUseException()
      : super('This email is already registered.');
}

class WeakPasswordException extends AuthException {
  const WeakPasswordException()
      : super('Password is too weak.');
}

class InvalidEmailException extends AuthException {
  const InvalidEmailException()
      : super('Invalid email address.');
}

class EmailNotVerifiedException extends AuthException {
  const EmailNotVerifiedException()
      : super('Please verify your email before logging in.');
}

class NetworkException extends AuthException {
  const NetworkException()
      : super('Network error. Please try again.');
}

class UnknownAuthException extends AuthException {
  const UnknownAuthException()
      : super('An unexpected authentication error occurred.');
}
