import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../localizations/language_ext.dart';
import '../app_config.dart';
import '../utils/ndgap.dart';

class Error404Widget extends StatelessWidget {
  const Error404Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.warning_amber_outlined,
                size: 128,
              ),
              ndGapH8(),
              const Text(
                '404 Not Found',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              ndGapH8(),
              Text(context.translate.error404),
              ndGapH48(),
              ElevatedButton(
                  onPressed: () {
                    context.go(AppConfig.initialPath);
                  },
                  child: Text(context.translate.home)),
            ],
          ),
        ),
      ),
    );
  }
}
