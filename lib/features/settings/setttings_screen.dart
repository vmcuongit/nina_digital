import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_setttings/app_setting_provider.dart';
import '../../localizations/language_ext.dart';

class SetttingsScreen extends ConsumerWidget {
  const SetttingsScreen({super.key});

  static const String nameRoute = 'settings';
  static const String pathRoute = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref
        .watch(appSettingProvider.select((value) => value.language.toString()));
    final theme =
        ref.watch(appSettingProvider.select((value) => value.theme.toString()));

    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate.home),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/ssss');
              },
              child: Text(
                'Chuyển trang ssss',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(appSettingProvider.notifier)
                    .changeLanguage(language: (lang == 'vi') ? 'en' : 'vi');
              },
              child: Text('Language: $lang'),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(appSettingProvider.notifier)
                    .changeTheme(theme: (theme == 'light') ? 'dark' : 'light');
              },
              child: Text('Theme: ${(theme == 'dark') ? 'light' : 'dark'}'),
            ),
          ],
        ),
      ),
    );
  }
}
