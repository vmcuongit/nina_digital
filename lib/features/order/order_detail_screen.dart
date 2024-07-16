import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key, required this.code});

  static const String nameRoute = 'order-detail';
  static const String pathRoute = ':code';

  final String code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết đơn hàng'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Text(code),
        ),
      ),
    );
  }
}
