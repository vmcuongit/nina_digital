import 'package:flutter/material.dart';

extension CustomTextEditingController on TextEditingController {
  void setTextWithCursor(String? newText) {
    var cursorPos = selection.base.offset;
    value = value.copyWith(
        text: newText ?? '',
        selection: TextSelection.collapsed(offset: cursorPos));
  }
}
