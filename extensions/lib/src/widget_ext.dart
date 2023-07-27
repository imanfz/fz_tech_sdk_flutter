import 'package:flutter/material.dart';

/// Widget Extension
extension WidgetExt on Widget {
  /// Add horizontal padding to the widget
  ///
  /// e.g: Text('Lorem Ipsum').paddingHorizontal(12)
  Widget paddingHorizontal(double padding) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: this);

  /// Add vertical padding to the widget
  ///
  /// e.g: Text('Lorem Ipsum').paddingVertical(12)
  Widget paddingVertical(double padding) =>
      Padding(padding: EdgeInsets.symmetric(vertical: padding), child: this);

  /// Add all the padding to the widget
  ///
  /// e.g: Text('Lorem Ipsum').paddingAll(12)
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  /// Add top padding to the widget
  ///
  /// e.g: Text('Lorem Ipsum').paddingTop(12)
  Widget paddingTop(double padding) =>
      Padding(padding: EdgeInsets.only(top: padding), child: this);

  /// Add bottom padding to the widget
  ///
  /// e.g: Text('Lorem Ipsum').paddingBottom(12)
  Widget paddingBottom(double padding) =>
      Padding(padding: EdgeInsets.only(bottom: padding), child: this);

  /// Add left padding to the widget
  ///
  /// e.g: Text('Lorem Ipsum').paddingLeft(12)
  Widget paddingLeft(double padding) =>
      Padding(padding: EdgeInsets.only(left: padding), child: this);

  /// Add right padding to the widget
  ///
  /// e.g: Text('Lorem Ipsum').paddingRight(12)
  Widget paddingRight(double padding) =>
      Padding(padding: EdgeInsets.only(right: padding), child: this);

  /// Add padding horizontal to widget
  ///
  /// e.g: Text('Lorem Ipsum').paddingHorizontal(12)
  Widget center() => Center(child: this);
}
