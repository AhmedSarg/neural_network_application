import 'dart:math';

import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  double width() => MediaQuery.of(this).size.width;

  double height() => MediaQuery.of(this).size.height;

  double minDim() =>
      min(MediaQuery.of(this).size.width, MediaQuery.of(this).size.height);
}

extension IntExt on int {
  Duration getMilliSec() {
    return Duration(milliseconds: this);
  }
}