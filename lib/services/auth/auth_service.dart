import 'package:firebase_auth/firebase_auth.dart';

import '../../models/auth/auth_result.dart';
import '../../models/auth/auth_user.dart';
import 'auth_exceptions.dart';

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthUser? get currentUser {
    final user = _auth.currentUser;

    if (user == null) return null;

    return AuthUser(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      photoUrl: user.photoURL,
      isEmailVerified: user.emailVerified,
    );
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final user = credential.user;

      if (user == null) {
        return AuthResult.failure(
          AuthException(
            code: 'login-failed',
            message: 'Unable to login.',
          ),
        );
      }

      return AuthResult.success(
        AuthUser(
          id: user.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          photoUrl: user.photoURL,
          isEmailVerified: user.emailVerified,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult.failure(
        AuthException.fromFirebase(e),
      );
    }
  }

  Future<AuthResult> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      await credential.user?.updateDisplayName(name);

      await credential.user?.reload();

      final user = _auth.currentUser!;

      return AuthResult.success(
        AuthUser(
          id: user.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          photoUrl: user.photoURL,
          isEmailVerified: user.emailVerified,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult.failure(
        AuthException.fromFirebase(e),
      );
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> sendPasswordResetEmail(
    String email,
  ) async {
    await _auth.sendPasswordResetEmail(
      email: email.trim(),
    );
  }

  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<void> reloadUser() async {
    await _auth.currentUser?.reload();
  }
}
