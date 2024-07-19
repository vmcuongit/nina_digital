import 'dart:io' show Platform;

import 'package:flutter/material.dart';

extension ViewPaddingBottom on BuildContext {
  double getViewPaddingBottom() {
    final result = MediaQuery.of(this).viewPadding.bottom;
    if (Platform.isIOS) {
      return result;
    }
    return result + 5;
  }
}
