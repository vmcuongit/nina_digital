import 'package:flutter/material.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({super.key});

  static const String nameRoute = 'stores';
  static const String pathRoute = '/stores';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('stores'),
      ),
    );
  }
}
