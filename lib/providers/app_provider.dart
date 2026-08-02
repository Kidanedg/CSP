import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool _initialized = false;
  bool _loading = false;
  bool _connected = true;

  String _appTitle = 'CSP';

  bool get initialized => _initialized;
  bool get isLoading => _loading;
  bool get isConnected => _connected;
  String get appTitle => _appTitle;

  Future<void> initialize() async {
    _loading = true;
    notifyListeners();

    // Future initialization:
    // - Firebase.initializeApp()
    // - Load SharedPreferences
    // - Load cached user
    // - Initialize notifications
    // - Initialize analytics

    await Future.delayed(const Duration(seconds: 1));

    _initialized = true;
    _loading = false;

    notifyListeners();
  }

  void setLoading(bool value) {
    if (_loading == value) return;

    _loading = value;
    notifyListeners();
  }

  void setConnectionStatus(bool connected) {
    if (_connected == connected) return;

    _connected = connected;
    notifyListeners();
  }

  void setAppTitle(String title) {
    _appTitle = title;
    notifyListeners();
  }

  void reset() {
    _initialized = false;
    _loading = false;
    _connected = true;
    _appTitle = 'CSP';

    notifyListeners();
  }
}
