// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

extension TextStylesExt on BuildContext {
  // text styles

  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get titleTextStyle => Theme.of(this).appBarTheme.titleTextStyle;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get bodyExtraSmall =>
      bodySmall?.copyWith(fontSize: 10, height: 1.6, letterSpacing: .5);

  TextStyle? get dividerTextLarge => bodySmall?.copyWith(
        letterSpacing: 1.5,
        fontWeight: FontWeight.w700,
        fontSize: 13,
        height: 1.23,
      );

  TextStyle? get dividerTextSmall => bodySmall?.copyWith(
        letterSpacing: 0.5,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      );
}

/// Font Weight extension for [TextStyle]
extension FontWeights on TextStyle {
  /// Black, the most thick
  TextStyle get thick => copyWith(fontWeight: FontWeight.w900);

  /// Extra-bold
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  /// Bold
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Semi-bold
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Medium
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Normal, regular, plain
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  /// Light
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Extra-light
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);

  /// Thin, the least thick
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
}

/// Converts in a simple way a [TextStyle] to the desired font style.
///
/// Example usage:
/// `textStyles.h1.italic`
extension FontStyles on TextStyle {
  /// Use the upright glyphs
  TextStyle get normal => copyWith(fontStyle: FontStyle.normal);

  /// Use glyphs designed for slanting
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

/// Converts in a simple way a textStyle to the desired font style.
///
/// Example usage:
/// `textStyles.underlined
extension DecorationStyles on TextStyle {
  /// e.g: u͟n͟d͟e͟r͟l͟i͟n͟e͟d͟
  TextStyle get underlined => copyWith(
        decoration: TextDecoration.underline,
      );

  /// e.g: 𝚞̲𝚗̲𝚍̲𝚎̲𝚛̲𝚕̲𝚒̲𝚗̲𝚎̲𝚍̲
  TextStyle get underlineDashed => copyWith(
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.dashed,
      );

  /// e.g: 𝚞⃨𝚗⃨𝚍⃨𝚎⃨𝚛⃨𝚕⃨𝚒⃨𝚗⃨𝚎⃨𝚍⃨
  TextStyle get underlineDotted => copyWith(
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.dotted,
      );

  /// e.g: u̳n̳d̳e̳r̳l̳i̳n̳e̳d̳
  TextStyle get underlinedDouble => copyWith(
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.double,
      );

  /// e.g: ṵn̰d̰ḛr̰l̰ḭn̰ḛd̰
  TextStyle get underlinedWavy => copyWith(
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.wavy,
      );
}
