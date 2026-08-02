import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService._();

  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance {
    if (_preferences == null) {
      throw Exception(
        'StorageService not initialized. Call StorageService.init() first.',
      );
    }
    return _preferences!;
  }

  // String

  static Future<bool> setString(String key, String value) =>
      instance.setString(key, value);

  static String? getString(String key) =>
      instance.getString(key);

  // Bool

  static Future<bool> setBool(String key, bool value) =>
      instance.setBool(key, value);

  static bool getBool(String key, {bool defaultValue = false}) =>
      instance.getBool(key) ?? defaultValue;

  // Int

  static Future<bool> setInt(String key, int value) =>
      instance.setInt(key, value);

  static int getInt(String key, {int defaultValue = 0}) =>
      instance.getInt(key) ?? defaultValue;

  // Double

  static Future<bool> setDouble(String key, double value) =>
      instance.setDouble(key, value);

  static double getDouble(String key, {double defaultValue = 0}) =>
      instance.getDouble(key) ?? defaultValue;

  // Remove

  static Future<bool> remove(String key) =>
      instance.remove(key);

  // Clear

  static Future<bool> clear() =>
      instance.clear();

  static bool contains(String key) =>
      instance.containsKey(key);
}
