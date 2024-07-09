import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  static const String nameRoute = 'news';
  static const String pathRoute = '/news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('news'),
      ),
    );
  }
}
