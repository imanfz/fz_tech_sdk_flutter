import 'dart:developer' as devtools show log;

import 'package:flutter/foundation.dart';

import 'miscellaneous_ext.dart';

/// Logger extensions
extension Logger on Object {
  /// Generate TAG from RuntimeType
  // ignore: non_constant_identifier_names, no_runtimetype_tostring
  String get TAG => runtimeType.toString();

  /// Logs an Object
  ///
  /// Instead of doing
  /// `log(object.toString())`
  /// you can do
  /// `object.logDebug()`
  /// only on debug mode, otherwise it doesn't show up
  void logDebug(String message, {String? tag}) {
    if (kDebugMode) {
      devtools.log(message, name: tag ?? TAG);
    }
  }

  /// Logs an Object
  ///
  /// Instead of doing
  /// `log(object.toString())`
  /// you can do
  /// `object.logInfo()`
  /// Log info
  void logInfo(String message, {String? tag}) {
    devtools.log(message, name: tag ?? TAG);
  }

  /// Logs an Object
  ///
  /// Instead of doing
  /// `log(object.toString())`
  /// you can do
  /// `object.logError()`
  /// Log error
  void logError(String message, {String? tag, StackTrace? stackTrace}) {
    devtools.log('', error: message, name: tag ?? TAG, stackTrace: stackTrace);
  }

  /// Logs an Object
  ///
  /// Instead of doing
  /// `print(jsonString)`
  /// you can do
  /// `object.printPrettyJson(jsonString)`
  /// example [json]: {"code":"0","text":"hello world"}
  void printPrettyJson(String json, {String? tag}) {
    try {
      final object = decoder.convert(json);
      final prettyString = encoder.convert(object);
      logInfo(prettyString, tag: tag ?? TAG);
    } catch (e) {
      logInfo(json);
    }
  }
}

/// Print an [String] Message with [tag]
///
/// Instead of doing
/// `print([message])`
/// you can do
/// `printDebug([message], tag: [tag])`
/// only on debug mode, otherwise it doesn't show up
void printDebug(String message, {String? tag}) {
  if (kDebugMode) {
    devtools.log(message, name: tag ?? '');
  }
}

/// Print an [String] Message with [tag]
///
/// Instead of doing
/// `print([message])`
/// you can do
/// `printInfo([message], tag: [tag])`
void printInfo(String message, {String? tag}) {
  devtools.log(message, name: tag ?? '');
}

/// Print an [String] Message with [tag]
///
/// Instead of doing
/// `print([message])`
/// you can do
/// `printError([message], tag: [tag])`
void printError(String message, {String? tag, StackTrace? stackTrace}) {
  devtools.log('', error: message, name: tag ?? '', stackTrace: stackTrace);
}

/// Print an [String] JSON with [tag]
///
/// Instead of doing
/// `print([json])`
/// you can do
/// `printPrettyJson([json], tag: [tag])`
/// example [json]: {"code":"0","text":"hello world"}
void printPrettyJson(String json, {String? tag}) {
  try {
    final object = decoder.convert(json);
    final prettyString = encoder.convert(object);
    printInfo(prettyString, tag: tag ?? '');
  } catch (e) {
    printInfo(json);
  }
}
