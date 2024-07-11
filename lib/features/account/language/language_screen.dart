import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_setttings/app_setting_provider.dart';
import '../../../localizations/language_ext.dart';
import '../../../shared/mixins/form_mixin.dart';

class LanguageScreen extends ConsumerStatefulWidget {
  const LanguageScreen({super.key});

  static const String nameRoute = 'language';
  static const String pathRoute = 'language';

  @override
  ConsumerState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends ConsumerState<LanguageScreen>
    with FormMixins {
  String lang = 'vi';

  @override
  void initState() {
    super.initState();
    lang = ref.read(appSettingProvider.select(
      (setting) => setting.language.toString(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        title: Text(context.translate.ngonngu),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ListTile(
            tileColor: Colors.white,
            leading: (lang == 'vi')
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : const SizedBox.shrink(),
            title: Text(context.translate.vi),
            onTap: () {
              lang = 'vi';
              setState(() {});
            },
          ),
          const SizedBox(
            height: 1,
          ),
          ListTile(
            tileColor: Colors.white,
            leading: (lang == 'en')
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : const SizedBox.shrink(),
            title: Text(context.translate.en),
            onTap: () {
              lang = 'en';
              setState(() {});
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        // width: double.infinity,
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: customButton(
          context,
          background: Theme.of(context).primaryColor,
          text: context.translate.xacnhan,
          textColor: Colors.white,
          onTap: () {
            ref
                .read(appSettingProvider.notifier)
                .changeLanguage(language: lang);
            context.pop();
          },
        ),
      ),
    );
  }
}
