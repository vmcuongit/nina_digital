import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/app_setttings/app_setting_provider.dart';
import '../../localizations/language_ext.dart';
import '../../shared/utils/ndgap.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const String nameRoute = 'home';
  static const String pathRoute = '/home';

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
                style: GoogleFonts.roboto(),
              ),
            ),
            ndGapH8(),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(appSettingProvider.notifier)
                    .changeLanguage(language: (lang == 'vi') ? 'en' : 'vi');
              },
              child: Text('Language: $lang'),
            ),
            ndGapH8(),
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
