import 'package:flutter/material.dart';

/// Theme Extension for BuildContext
extension ThemeExt on BuildContext {
  /// Indicates whether the app is in dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Indicates whether the app is in light mode
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;
}
