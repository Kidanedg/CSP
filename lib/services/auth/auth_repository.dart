import '../../models/auth_user.dart';
import 'auth_result.dart';

abstract class AuthRepository {
  Future<AuthResult<AuthUser>> login({
    required String email,
    required String password,
  });

  Future<AuthResult<AuthUser>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<AuthResult<void>> logout();

  Future<AuthResult<void>> forgotPassword(String email);

  Future<AuthResult<void>> sendEmailVerification();

  Future<bool> isLoggedIn();
}
