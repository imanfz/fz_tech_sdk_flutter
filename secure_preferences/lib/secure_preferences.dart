library secure_preferences;

// ignore_for_file: public_member_api_docs
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecurePreferences {
  SecurePreferences({String name = ''}) {
    _prefix = 'flutter.$name${kDebugMode ? 'debug' : 'release'}';
    SharedPreferences.setPrefix(_prefix);
    SharedPreferences.getInstance().then((value) => _sharedPreferences = value);
  }

  late final String _prefix;
  late final SharedPreferences _sharedPreferences;

  /// Method to get String from local storage
  /// [key] -> Key which you have provided while setting
  String? getString(String key) => _sharedPreferences.getString(key);

  /// Method to get String from local storage
  /// [key] -> Key which you have provided while setting
  int? getInt(String key) => _sharedPreferences.getInt(key);

  /// Method to get boolean from local storage
  /// [key] -> Key which you have provided while setting
  bool? getBool(String key) => _sharedPreferences.getBool(key);

  /// Method to get double from local storage
  /// [key] -> Key which you have provided while setting
  double? getDouble(String key) => _sharedPreferences.getDouble(key);

  /// Method to get StringList from local storage
  /// [key] -> Key which you have provided while setting
  List<String> getStringList(String key) {
    return _sharedPreferences.getStringList(key) ?? [];
  }

  /// Method to set String in local storage
  /// [key] -> Key for key-value pair
  /// [val] -> Value for key-value pair
  Future<void> putString(String key, String val) =>
      _sharedPreferences.setString(key, val);

  /// Method to set int in local storage
  /// [key] -> Key for key-value pair
  /// [val] -> Value for key-value pair
  void putInt(String key, int val) => _sharedPreferences.setInt(key, val);

  /// Method to set boolean in local storage
  /// [key] -> Key for key-value pair
  /// [val] -> Value for key-value pair
  void putBool(String key, bool val) => _sharedPreferences.setBool(key, val);

  /// Method to set double in local storage
  /// [key] -> Key for key-value pair
  /// [val] -> Value for key-value pair
  void putDouble(String key, double val) =>
      _sharedPreferences.setDouble(key, val);

  /// Method to set StringList in local storage
  /// [key] -> Key for key-value pair
  /// [val] -> Value for key-value pair
  Future<bool> putStringList(String key, List<String> val) =>
      _sharedPreferences.setStringList(key, val);

  /// Method for deleting data by key.
  Future<bool> remove(String key) => _sharedPreferences.remove(key);

  /// Method for deleting all data.
  Future<void> clearAll() => _sharedPreferences.clear();
}

