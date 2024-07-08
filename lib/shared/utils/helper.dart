import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';

class Helper {
  // định dạng tiền tệ
  static String numberFormat(double num, {String? symbol = ''}) {
    var numFormat = NumberFormat.currency(locale: 'vi_VN', symbol: symbol);
    return numFormat.format(num ?? 0);
  }

  // mã hoá MD5
  static String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  // chuyển từ DateTime sang Time(int)
  static int convertDateTimeToTimestamp(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch ~/ 1000;
  }

  // chuyển từ Time(int) sang DateTime
  static DateTime convertTimestampToDateTime(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  // Tạo random chuỗi ký tự với ký tự đầu và số ký tự
  static String generateUniqueString(
      {String kyTuDau = '', int maxLength = 10}) {
    // Lấy thời gian hiện tại dưới dạng timestamp
    int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    // Chuyển đổi timestamp thành một chuỗi
    String timestampString = timestamp.toString();

    // Sử dụng hàm hash MD5 để làm ngắn chuỗi và chỉ lấy maxLength ký tự đầu tiên bao gồm kyTuDau
    String uniqueString = kyTuDau +
        md5
            .convert(utf8.encode(timestampString))
            .toString()
            .substring(0, maxLength - kyTuDau.length);

    return uniqueString;
  }
}

class Loading {
  late BuildContext context;

  Loading(this.context);

  Future<void> start() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context2) {
        return const Dialog(
          elevation: 0.0,
          backgroundColor:
              Colors.transparent, // can change this to your prefered color
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // The loading indicator
                CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> stop() async {
    context.pop();
  }
}