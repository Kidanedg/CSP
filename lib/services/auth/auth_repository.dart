import '../../models/auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser?> signIn({
    required String email,
    required String password,
  });

  Future<AuthUser?> register({
    required String fullName,
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<AuthUser?> currentUser();
}
