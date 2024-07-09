import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const String nameRoute = 'account';
  static const String pathRoute = '/account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('account'),
      ),
    );
  }
}
