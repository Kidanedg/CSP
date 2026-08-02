import '../../models/auth_user.dart';
import 'auth_repository.dart';
import 'auth_result.dart';
import 'auth_exceptions.dart';

class AuthService implements AuthRepository {
  AuthUser? _currentUser;

  AuthUser? get currentUser => _currentUser;

  @override
  Future<AuthResult<AuthUser>> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      if (email.isEmpty || password.isEmpty) {
        throw const InvalidCredentialsException();
      }

      _currentUser = AuthUser(
        id: "1",
        name: "Demo User",
        email: email,
        emailVerified: false,
      );

      return AuthResult.success(
        data: _currentUser,
        message: "Login successful.",
      );
    } on AuthException catch (e) {
      return AuthResult.failure(e.message);
    }
  }

  @override
  Future<AuthResult<AuthUser>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      if (password.length < 6) {
        throw const WeakPasswordException();
      }

      _currentUser = AuthUser(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        email: email,
        emailVerified: false,
      );

      return AuthResult.success(
        data: _currentUser,
        message: "Registration successful.",
      );
    } on AuthException catch (e) {
      return AuthResult.failure(e.message);
    }
  }

  @override
  Future<AuthResult<void>> logout() async {
    _currentUser = null;

    return AuthResult.success(
      message: "Logged out.",
    );
  }

  @override
  Future<AuthResult<void>> forgotPassword(String email) async {
    return AuthResult.success(
      message: "Password reset email sent.",
    );
  }

  @override
  Future<AuthResult<void>> sendEmailVerification() async {
    return AuthResult.success(
      message: "Verification email sent.",
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    return _currentUser != null;
  }
}
