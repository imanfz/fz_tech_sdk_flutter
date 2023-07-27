import 'package:flutter/material.dart';

/// Color extension on BuildContext
extension ColorExt on BuildContext {
  /// Get primary color from theme
  Color get primaryColor => Theme.of(this).primaryColor;

  /// Get primary color from theme
  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  /// Get primary color of light from theme
  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  /// Get hint color from theme
  Color get hintColor => Theme.of(this).hintColor;

  /// Get disabled color from theme
  Color get disabledColor => Theme.of(this).disabledColor;

  /// Get primary from theme
  Color get primary => Theme.of(this).colorScheme.primary;

  /// Get onPrimary color from theme
  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  /// Get secondary color from theme
  Color get secondary => Theme.of(this).colorScheme.secondary;

  /// Get onSecondary color from theme
  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  /// Get card color from theme
  Color get cardColor => Theme.of(this).cardColor;

  /// Get primary color from theme
  Color get errorColor => Theme.of(this).colorScheme.error;

  /// Get background color from theme
  Color get background => Theme.of(this).colorScheme.background;

  /// Get shadow color from theme
  Color get shadow => Theme.of(this).colorScheme.shadow;
}
