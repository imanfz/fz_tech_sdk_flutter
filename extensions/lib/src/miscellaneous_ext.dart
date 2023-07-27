import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

/// Decoder for json
JsonDecoder decoder = const JsonDecoder();

/// Encoder for json
JsonEncoder encoder = const JsonEncoder.withIndent('  ');

/// Allows to insert a separator between the items of the iterable.
extension SeparatedIterable on Iterable<Widget> {
  /// Allows to insert a [separator] between the items of the iterable.
  List<Widget> separatedBy(
    Widget separator, {
    bool? withFirst,
    bool? withLast,
  }) {
    final result = <Widget>[];
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      /// added a top separator as needed
      if (withFirst ?? false) {
        result.add(separator);
      }
      result.add(iterator.current);
      while (iterator.moveNext()) {
        result
          ..add(separator)
          ..add(iterator.current);
      }

      /// added a bottom separator as needed
      if (withLast ?? false) {
        result.add(separator);
      }
    }
    return result;
  }

  /// Allows to insert a space between the items of the iterable.
  List<Widget> spaceBetween({
    double? width,
    double? height,
    bool? withFirst,
    bool? withLast,
  }) {
    final result = <Widget>[];
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      /// added a top separator as needed
      if (withFirst ?? false) {
        result.add(SizedBox(width: width, height: height));
      }
      result.add(iterator.current);
      while (iterator.moveNext()) {
        result
          ..add(SizedBox(width: width, height: height))
          ..add(iterator.current);
      }

      /// added a bottom separator as needed
      if (withLast ?? false) {
        result.add(SizedBox(width: width, height: height));
      }
    }
    return result;
  }
}

/// Convert a [Duration] into a [Future].
extension FutureDuration on Duration {
  /// Creates a future that runs its computation after a delay.
  ///
  /// The [computation] will be executed after the given [Duration] has passed,
  /// and the future is completed with the result of the computation.
  ///
  /// If [computation] returns a future,
  /// the future returned by this constructor will complete with the value or
  /// error of that future.
  ///
  /// If the duration is 0 or less,
  /// it completes no sooner than in the next event-loop iteration,
  /// after all microtasks have run.
  ///
  /// If [computation] is omitted,
  /// it will be treated as if [computation] was `() => null`,
  /// and the future will eventually complete with the `null` value.
  ///
  /// If calling [computation] throws, the created future will complete with the
  /// error.
  Future<dynamic> future([FutureOr<dynamic> Function()? computation]) {
    return Future.delayed(this, computation);
  }
}
