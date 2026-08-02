import 'package:flutter/material.dart';

import '../models/auth/auth_result.dart';
import '../models/auth/auth_user.dart';
import '../services/auth/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService.instance;

  AuthUser? _user;
  bool _isLoading = false;

  AuthUser? get user => _user;

  bool get isLoading => _isLoading;

  bool get isLoggedIn => _user != null;

  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    final result = await _authService.login(
      email: email,
      password: password,
    );

    if (result.isSuccess) {
      _user = result.user;
    }

    _isLoading = false;
    notifyListeners();

    return result;
  }

  Future<AuthResult> register({
    required String name,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    final result = await _authService.register(
      name: name,
      email: email,
      password: password,
    );

    if (result.isSuccess) {
      _user = result.user;
    }

    _isLoading = false;
    notifyListeners();

    return result;
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    await _authService.logout();

    _user = null;

    _isLoading = false;
    notifyListeners();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _authService.sendPasswordResetEmail(email);
  }

  Future<void> sendEmailVerification() async {
    await _authService.sendEmailVerification();
  }

  Future<void> refreshUser() async {
    await _authService.reloadUser();
    _user = _authService.currentUser;
    notifyListeners();
  }

  void loadCurrentUser() {
    _user = _authService.currentUser;
    notifyListeners();
  }
}
