import 'dart:async';

class AuthService {
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 2));

    // Temporary authentication
    return email.isNotEmpty && password.isNotEmpty;
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    return name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<bool> isLoggedIn() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return false;
  }
}
