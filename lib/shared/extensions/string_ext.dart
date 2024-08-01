import 'dart:ui';

extension StringUtil on String {
  String decodeHtml() {
    return replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&amp;', '&');
  }

  Color get toColor {
    String data = replaceAll('#', '');
    if (data.length == 6) {
      data = 'FF$data';
    }
    return Color(int.parse('0x$data'));
  }

  String maxLength(int length) {
    if (length > length) {
      return this;
    } else {
      return '${substring(0, length)}...';
    }
  }

  int? toInt({int? defaultValue}) {
    try {
      return int.parse(this);
    } catch (e) {
      return defaultValue;
    }
  }

  double toDouble({double defaultValue = 0}) {
    try {
      return double.parse(this);
    } catch (e) {
      return defaultValue;
    }
  }

  String capitalizeWords() {
    if (trim().isEmpty) {
      return '';
    }
    return split(' ')
        .map((element) =>
            '${element[0].toUpperCase()}${element.substring(1).toLowerCase()}')
        .join(' ');
  }
}
