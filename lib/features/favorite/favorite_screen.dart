import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  static const String nameRoute = 'favorite';
  static const String pathRoute = '/favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('favorite'),
      ),
    );
  }
}
