import 'package:flutter/services.dart';

class EvonInputFormatters {
  static List<TextInputFormatter> get({
    int limit = 15,
    bool isSingleLine = false,
    bool noDigit = false,
    bool digitOnly = false,
  }) {
    final list = <TextInputFormatter>[];

    if (limit > 0) {
      list.add(LengthLimitingTextInputFormatter(limit));
    }
    if (isSingleLine) {
      list.add(FilteringTextInputFormatter.singleLineFormatter);
    }
    if (noDigit) {
      list.add(FilteringTextInputFormatter.deny(RegExp(r'[0-9]')));
    }
    if (digitOnly) {
      list.add(FilteringTextInputFormatter.digitsOnly);
    }

    return list;
  }
}
