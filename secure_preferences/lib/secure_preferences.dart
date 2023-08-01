library;

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Secure Shared Preferences
class SecurePreferences {
  /// Private constructor
  SecurePreferences._(this._sharedPreferences);

  /// Private instance of [SecurePreferences]
  static SecurePreferences? _instance;

  /// Instance of [SharedPreferences]
  late final SharedPreferences _sharedPreferences;

  /// Loads and parses the [SecurePreferences] for this app from disk.
  ///
  /// Because this is reading from disk, it shouldn't be awaited in
  /// performance-sensitive blocks.
  static Future<SecurePreferences> getInstance() async {
    if (_instance == null) {
      const prefix = 'flutter.${kDebugMode ? 'debug' : 'release'}.';
      SharedPreferences.setPrefix(prefix);
      final sharedPreferences = await SharedPreferences.getInstance();
      _instance = SecurePreferences._(sharedPreferences);
    }

    return _instance!;
  }

  /// Encrypt [String] to Base64
  String _encrypt(String value) =>
      base64UrlEncode(utf8.encode(base64UrlEncode(utf8.encode(value))));

  /// Decrypt Base64 to [String]
  String _decrypt(String value) =>
      utf8.decode(base64Url.decode(utf8.decode(base64.decode(value))));

  /// Method to get String from local storage
  /// [key] -> Key which you have provided while setting
  String? getString(String key) {
    final result = _sharedPreferences.getString(_encrypt(key));
    return result != null ? _decrypt(result) : result;
  }

  /// Method to get String from local storage
  /// [key] -> Key which you have provided while setting
  int? getInt(String key) {
    final result = _sharedPreferences.getString(_encrypt(key));
    return int.tryParse(_decrypt(result ?? ''));
  }

  /// Method to get boolean from local storage
  /// [key] -> Key which you have provided while setting
  bool? getBool(String key) {
    final result = _sharedPreferences.getString(_encrypt(key));
    return bool.tryParse(result ?? '');
  }

  /// Method to get double from local storage
  /// [key] -> Key which you have provided while setting
  double? getDouble(String key) {
    final result = _sharedPreferences.getString(_encrypt(key));
    return double.tryParse(result ?? '');
  }

  /// Method to get StringList from local storage
  /// [key] -> Key which you have provided while setting
  List<String>? getStringList(String key) {
    final result = _sharedPreferences.getStringList(_encrypt(key));
    return result?.map(_decrypt).toList();
  }

  /// Method to get Map from local storage
  /// [key] -> Key which you have provided while setting
  Map<String, dynamic>? getMap(String key) {
    final result = _sharedPreferences.getString(_encrypt(key));
    return result != null ? jsonDecode(result) as Map<String, dynamic> : null;
  }

  /// Method to set String in local storage
  /// [key] -> Key for key-value pair
  /// [val] -> Value for key-value pair
  Future<bool> putString(String key, String val) =>
      _sharedPreferences.setString(_encrypt(key), _encrypt(val));

  /// Method to set int in local storage
  /// [key] -> Key for key-value pair
  /// [val] -> Value for key-value pair
  void putInt(String key, int val) =>
      _sharedPreferences.setString(_encrypt(key), _encrypt(val.toString()));

  /// Method to set boolean in local storage
  /// [key] -> Key for key-value pair
  /// [val] -> Value for key-value pair
  // ignore: avoid_positional_boolean_parameters
  void putBool(String key, bool val) =>
      _sharedPreferences.setString(_encrypt(key), _encrypt(val.toString()));

  /// Method to set double in local storage
  /// [key] -> Key for key-value pair
  /// [val] -> Value for key-value pair
  void putDouble(String key, double val) =>
      _sharedPreferences.setString(_encrypt(key), _encrypt(val.toString()));

  /// Method to set StringList in local storage
  /// [key] -> Key for key-value pair
  /// [val] -> Value for key-value pair
  Future<bool> putStringList(String key, List<String> val) =>
      _sharedPreferences.setStringList(
        _encrypt(key),
        val.map(_encrypt).toList(),
      );

  /// Method to set Map in local storage
  /// [key] -> Key for key-value pair
  /// [val] -> Value for key-value pair
  Future<bool> putMap(String key, Map<dynamic, dynamic> val) =>
      _sharedPreferences.setString(
        _encrypt(key),
        _encrypt(json.encode(val)),
      );

  /// Method for deleting data by key.
  Future<bool> remove(String key) => _sharedPreferences.remove(_encrypt(key));

  /// Method for deleting of all data.
  Future<void> clearAll() => _sharedPreferences.clear();
}
