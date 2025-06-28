import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const _keyLoggedIn = 'is_logged_in';
  static const String _keyFirstOpen = 'is_first_open';

  /// Initialize the session manager, checking if it's the first open
  static Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    print('>> [SharedPrefs] Set logged in: $value');
    await prefs.setBool(_keyLoggedIn, value);
  }

  /// Check if the user is logged in
  /// Returns true if logged in, false otherwise
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final status = prefs.getBool(_keyLoggedIn) ?? false;
    print('>> [SharedPrefs] Read is_logged_in: $status');
    return prefs.getBool(_keyLoggedIn) ?? false;
  }

  /// Get the current login status
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyLoggedIn);
  }

  /// Check if this is the first time the app is opened
  static Future<void> setFirstOpen(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyFirstOpen, value);
  }
  
  /// Returns true if this is the first time the app is opened, false otherwise
  static Future<bool> isFirstOpen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyFirstOpen) ?? true; // default true
  }
}
