import 'package:flutter/material.dart';

class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({super.key});

  static const String nameRoute = 'search';
  static const String pathRoute = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tìm kiếm'),
        centerTitle: false,
      ),
      body: Center(
        child: Text('Nội dung tìm kiếm'),
      ),
    );
  }
}
