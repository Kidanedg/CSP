import '../../models/auth_user.dart';
import 'auth_repository.dart';

class AuthService implements AuthRepository {
  AuthUser? _currentUser;

  @override
  Future<AuthUser?> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    _currentUser = AuthUser(
      id: '1',
      fullName: 'Demo User',
      email: email,
    );

    return _currentUser;
  }

  @override
  Future<AuthUser?> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    _currentUser = AuthUser(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fullName: fullName,
      email: email,
    );

    return _currentUser;
  }

  @override
  Future<AuthUser?> currentUser() async {
    return _currentUser;
  }

  @override
  Future<void> signOut() async {
    _currentUser = null;
  }
}
