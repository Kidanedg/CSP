import 'preference_keys.dart';
import 'storage_service.dart';

class SessionManager {
  SessionManager._();

  static Future<void> saveLogin({
    required String token,
    required String userId,
    required String email,
    required String displayName,
    required bool rememberMe,
  }) async {
    await StorageService.setBool(
      PreferenceKeys.isLoggedIn,
      true,
    );

    await StorageService.setString(
      PreferenceKeys.authToken,
      token,
    );

    await StorageService.setString(
      PreferenceKeys.userId,
      userId,
    );

    await StorageService.setString(
      PreferenceKeys.email,
      email,
    );

    await StorageService.setString(
      PreferenceKeys.displayName,
      displayName,
    );

    await StorageService.setBool(
      PreferenceKeys.rememberMe,
      rememberMe,
    );
  }

  static bool get isLoggedIn =>
      StorageService.getBool(
        PreferenceKeys.isLoggedIn,
      );

  static bool get rememberMe =>
      StorageService.getBool(
        PreferenceKeys.rememberMe,
      );

  static String? get token =>
      StorageService.getString(
        PreferenceKeys.authToken,
      );

  static String? get userId =>
      StorageService.getString(
        PreferenceKeys.userId,
      );

  static String? get email =>
      StorageService.getString(
        PreferenceKeys.email,
      );

  static String? get displayName =>
      StorageService.getString(
        PreferenceKeys.displayName,
      );

  static Future<void> logout() async {
    await StorageService.remove(
      PreferenceKeys.authToken,
    );

    await StorageService.remove(
      PreferenceKeys.userId,
    );

    await StorageService.remove(
      PreferenceKeys.email,
    );

    await StorageService.remove(
      PreferenceKeys.displayName,
    );

    await StorageService.setBool(
      PreferenceKeys.isLoggedIn,
      false,
    );
  }

  static Future<void> clearSession() async {
    await StorageService.clear();
  }
}
