import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';
import '../services/auth/auth_user.dart';
import '../services/auth/auth_result.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  AuthUser? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;

  AuthUser? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  bool get isLoggedIn => _currentUser != null;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    _setLoading(true);

    final AuthResult<AuthUser> result = await _authService.login(
      email: email,
      password: password,
    );

    _setLoading(false);

    if (result.isSuccess) {
      _currentUser = result.data;
      _errorMessage = null;
      notifyListeners();
      return true;
    }

    _errorMessage = result.message;
    notifyListeners();
    return false;
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    _setLoading(true);

    final AuthResult<AuthUser> result = await _authService.register(
      name: name,
      email: email,
      password: password,
    );

    _setLoading(false);

    if (result.isSuccess) {
      _currentUser = result.data;
      _errorMessage = null;
      notifyListeners();
      return true;
    }

    _errorMessage = result.message;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    _setLoading(true);

    await _authService.logout();

    _currentUser = null;
    _errorMessage = null;

    _setLoading(false);
    notifyListeners();
  }

  Future<bool> forgotPassword(String email) async {
    _setLoading(true);

    final result = await _authService.forgotPassword(email);

    _setLoading(false);

    if (result.isSuccess) {
      _errorMessage = null;
      notifyListeners();
      return true;
    }

    _errorMessage = result.message;
    notifyListeners();
    return false;
  }

  Future<bool> sendEmailVerification() async {
    _setLoading(true);

    final result = await _authService.sendEmailVerification();

    _setLoading(false);

    if (result.isSuccess) {
      _errorMessage = null;
      notifyListeners();
      return true;
    }

    _errorMessage = result.message;
    notifyListeners();
    return false;
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
