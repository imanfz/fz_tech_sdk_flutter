import 'widget_ext.dart';
import 'num_ext.dart';
import 'package:flutter/material.dart';

/// Extension for context or BuildContext
extension ContextExt on BuildContext {
  // Screen Size
  /// Indicates if the device is a mobile/phone
  bool get isMobile => MediaQuery.of(this).size.width <= 500.0;

  /// Indicates if the device is a tablet/pad
  bool get isTablet =>
      MediaQuery.of(this).size.width < 1024.0 &&
      MediaQuery.of(this).size.width >= 650.0;

  /// Indicates if the device is a small tablet
  bool get isSmallTablet =>
      MediaQuery.of(this).size.width < 650.0 &&
      MediaQuery.of(this).size.width > 500.0;

  /// Indicates if the device is a desktop/laptop
  bool get isDesktop => MediaQuery.of(this).size.width >= 1024.0;

  /// Indicates if the device is a small
  bool get isSmall =>
      MediaQuery.of(this).size.width < 850.0 &&
      MediaQuery.of(this).size.width >= 560.0;

  /// Getting width of screen device
  double get width => MediaQuery.of(this).size.width;

  /// Getting width of height device
  double get height => MediaQuery.of(this).size.height;

  /// Getting size of screen device
  Size get size => MediaQuery.of(this).size;

  /// Show alert dialog/popups
  /// with custom [title] and [message]
  void showAlertDialog(String title, String message) {
    showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Stack(
            children: <Widget>[Text(message)],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Close',
                textAlign: TextAlign.center,
              ),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            ),
          ],
        );
      },
    );
  }

  /// Show action dialog/popups
  /// with custom [title], [message], and label of action [actionText]
  void showActionDialog(
    String title,
    String message, {
    required VoidCallback? onPressed,
    String? actionText,
    bool dismissible = false,
  }) {
    showDialog<void>(
      context: this,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Stack(
            children: <Widget>[Text(message)],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(actionText ?? 'Yes'),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                onPressed!();
              },
            ),
            TextButton(
              child: const Text('Close'),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            ),
          ],
        );
      },
    );
  }

  /// Show custom dialog/popups
  /// with [alertDialog] you need
  void showCustomDialog(
    AlertDialog alertDialog, {
    bool dismissible = false,
  }) {
    showDialog<void>(
      context: this,
      barrierDismissible: dismissible,
      builder: (_) {
        // return object of type Dialog
        return alertDialog;
      },
    );
  }

  /// Show modal bottom sheet
  void showBottomSheet(
    Widget child, {
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    showModalBottomSheet<void>(
      context: this,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      builder: (_) => Container(
        width: double.infinity,
        padding: 16.paddingAll,
        child: child,
      ),
    );
  }

  /// Show Snack bar with custom [message]
  /// and can enabled close button if [showCloseIcon] is true
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message, {
    bool showCloseIcon = false,
    SnackBarAction? action,
  }) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        showCloseIcon: showCloseIcon,
        action: action,
      ),
    );
  }

  /// Show the Loading
  void showLoading() {
    showDialog<void>(
      context: this,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading'),
            ],
          ).paddingVertical(16),
        );
      },
    );
  }

  /// Hide the loading
  void hideLoading() {
    Navigator.of(this, rootNavigator: true).pop();
  }
}
