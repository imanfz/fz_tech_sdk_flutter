import 'object_ext.dart';
import 'package:intl/intl.dart';

/// String extensions
extension StringExt on String {
  /// Capitalizes each word in the string, e.g.:
  /// `hello world` becomes `Hello World`.
  String get capitalize {
    return split(' ').map((e) => e.capitalizeFirst).join(' ');
  }

  /// Capitalizes the first word in the string, e.g.:
  /// `hello` becomes `Hello`.
  String get capitalizeFirst {
    if (length == 0) return '';
    if (length == 1) return toUpperCase();
    return substring(0, 1).toUpperCase() + substring(1);
  }

  /// Indicates if the string is a boolean
  ///
  /// If [caseSensitive] is `true`, which is the default,
  /// the only accepted inputs are the strings `"true"` and `"false"`,
  /// Example:
  /// ```dart
  /// print('true'.isBool()); // true
  /// print('false'.isBool()); // true
  /// print('TRUE'.isBool()); // false
  /// print('TRUE'.isBool(caseSensitive: false)); // true
  /// print('FALSE'.isBool(caseSensitive: false)); // true
  /// print('NO'.isBool()); // false
  /// print('YES'.isBool()); // false
  /// print('0'.isBool()); // false
  /// print('1'.isBool()); // false
  /// ```
  bool isBool({bool caseSensitive = true}) =>
      bool.tryParse(this, caseSensitive: caseSensitive) != null;

  /// Converts the string into a Boolean
  ///
  /// Throws if the string is not a Boolean.
  /// If [caseSensitive] is `true`, which is the default,
  /// the only accepted inputs are the strings `"true"` and `"false"`,
  bool toBool({bool caseSensitive = true}) =>
      bool.parse(this, caseSensitive: caseSensitive);

  /// Indicates if the string is a number
  ///
  /// print('2021'.isNum()); // true
  /// print('3.14'.isNum()); // true
  /// print('  3.14 \xA0'.isNum()); // true
  /// print('0.'.isNum()); // true
  /// print('.0'.isNum()); // true
  /// print('-1.e3'.isNum()); // true
  /// print('1234E+7'.isNum()); // true
  /// print('+.12e-9'.isNum()); // true
  /// print('-NaN'.isNum()); // true
  /// print('0xFF'.isNum()); // true
  /// print(double.infinity.toString().isNum()); // true
  /// print('1f'.isNum()); // false
  bool get isNum => num.tryParse(this) != null;

  /// Converts the string into a [num]
  ///
  /// Throws if the string is not a number.
  num get toNum => num.parse(this);

  /// Indicates if the string is a double number
  bool get isDouble => double.tryParse(this) != null;

  /// Converts the string into an [double]
  ///
  /// Throws if the string is not an Double number.
  double get toDouble => double.parse(this);

  /// Indicates if the string is an integer number
  bool get isInt => int.tryParse(this) != null;

  /// Converts the string into an [int]
  ///
  /// Throws if the string is not an Integer.
  int get toInt => int.parse(this);

  /// Removes all the whitespace from the string
  String get removeAllWhitespace => replaceAll(' ', '');

  /// Checks whether this regular expression has a match in the [pattern].
  bool hasMatch(String pattern) => RegExp(pattern).hasMatch(this);

  /// Check if string contain symbol
  bool get hasSymbol =>
      contains(RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/,><:;_~`+=]'));

  /// Check if string contain number
  bool get hasNumber => contains(RegExp('[0-9]'));

  /// Check if string contain uppercase
  bool get hasUppercase => contains(RegExp('[A-Z]'));

  /// Check if string contain lowercase
  bool get hasLowercase => contains(RegExp('[a-z]'));

  /// Indicates if the string is a username
  bool get isValidUsername => hasMatch(r'^[A-Za-z][A-Za-z0-9_]{2,29}$');

  /// Indicates if the string is a strong password
  bool get isValidWeakPassword => hasMatch(r'^.{8,}$');

  /// Indicates if the string is a strong password
  bool get isValidStrongPassword =>
      hasMatch(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$');

  /// Indicates if the string is a strong password
  bool get isValidStrongPasswordWithSpecialChar => hasMatch(
        r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*?[!@#\$&*~])(?=.*?[!@#$%^&*+=/?).{8,}',
      );

  /// Indicates if the string is a email
  bool get isValidEmail => hasMatch(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      );

  /// Indicates if the string is a phone number
  bool get isValidPhoneNumber => hasMatch(r'^(?:[+0]9)?[0-9]{10,14}$');

  /// Function to check if string contain sequential digits
  bool isContainSequentialDigits() {
    for (var i = 0; i < length - 2; i++) {
      final currentDigit = int.parse(this[i]);
      final nextDigit = int.parse(this[i + 1]);
      final thirdDigit = int.parse(this[i + 2]);

      if (currentDigit + 1 == nextDigit && nextDigit + 1 == thirdDigit) {
        return true;
      }
    }

    return false;
  }

  /// Function to check if string contain alphabets
  bool isContainSequentialAlphabets() {
    for (var i = 0; i < length - 2; i++) {
      final currentChar = this[i];
      final nextChar = String.fromCharCode(codeUnitAt(i + 1));
      final thirdChar = String.fromCharCode(codeUnitAt(i + 2));

      if (currentChar.codeUnitAt(0) + 1 == nextChar.codeUnitAt(0) &&
          nextChar.codeUnitAt(0) + 1 == thirdChar.codeUnitAt(0)) {
        return true;
      }
    }

    return false;
  }

  /// Function to check if string contain sequential digits
  bool get isContainSameThreeDigits => hasMatch(r'(\d)\1{2}');

  /// Indicates if the string is a blank or empty
  bool get isBlank => trim().isEmpty;

  /// Indicates if the string is a not blank or not empty
  bool get isNotBlank => !isBlank;

  /// Function to get first name
  String get firstName =>
      (isBlank || !contains(' ')) ? '' : trim().split(' ').first;

  /// Function to get last name
  String get lastName =>
      (isBlank || !contains(' ')) ? '' : trim().split(' ').last;

  /// Getting initial name
  String getInitialName({
    int limit = 2,
  }) {
    if (isBlank) {
      return this;
    }

    final tmp = trim().split(' ').map((s) => s[0]);
    try {
      return tmp.join().substring(0, limit);
    } catch (e) {
      logError(e.toString());
      return tmp.join();
    }
  }

  /// Getting value only number
  String get number => replaceAll(RegExp('[^0-9]'), '');

  /// Convert string to currency, default value is IDR
  String toCurrency({
    String locale = 'id',
    String? symbol, // for replace default symbols
    int decimalDigits = 2,
  }) {
    if (isEmpty) {
      return '';
    }

    final currencyFormatter = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: decimalDigits,
    );
    return currencyFormatter.format(toDouble);
  }

  /// Convert string to date
  DateTime? toDate({
    String? format,
  }) {
    try {
      final outputFormat = DateFormat(format);
      return outputFormat.parse(this);
    } catch (e) {
      logError(e.toString());
      return null;
    }
  }
}
