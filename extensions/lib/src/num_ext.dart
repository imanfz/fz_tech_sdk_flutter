import 'package:flutter/material.dart';

/// Converts a [num] into an [EdgeInsets]
extension PaddingNum on num {
  /// Creates insets where all the offsets are `value`.
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());

  /// Creates insets with symmetric horizontal offsets.
  EdgeInsets get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());

  /// Creates insets with symmetric vertical offsets.
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: toDouble());

  /// Creates insets with only the top value.
  EdgeInsets get paddingTop => EdgeInsets.only(top: toDouble());

  /// Creates insets with only the left value.
  EdgeInsets get paddingLeft => EdgeInsets.only(left: toDouble());

  /// Creates insets with only the right value.
  EdgeInsets get paddingRight => EdgeInsets.only(right: toDouble());

  /// Creates insets with only the bottom value.
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: toDouble());
}

/// Provides conversions from [num] to [Duration]
extension DurationExt on num {
  /// Converts the number into a [Duration] in microseconds
  Duration get microseconds => Duration(microseconds: round());

  /// Converts the number into a [Duration] in milliseconds
  Duration get milliseconds => Duration(milliseconds: round());

  /// Converts the number into a [Duration] in seconds
  Duration get seconds => Duration(seconds: round());

  /// Converts the number into a [Duration] in minutes
  Duration get minutes => Duration(minutes: round());

  /// Converts the number into a [Duration] in hours
  Duration get hours => Duration(hours: round());

  /// Converts the number into a [Duration] in days
  Duration get days => Duration(days: round());

  /// Converts the number into a [Duration] in months
  Duration get months => Duration(days: 30 * round());

  /// Converts the number into a [Duration] in quarters
  Duration get quarters => Duration(days: 90 * round());

  /// Converts the number into a [Duration] in quadrimesters
  Duration get quadrimesters => Duration(days: 120 * round());

  /// Converts the number into a [Duration] in years
  Duration get years => Duration(days: 365 * round());
}
