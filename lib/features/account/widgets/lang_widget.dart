part of '../account_screen.dart';

class _LangWidget extends ConsumerWidget {
  const _LangWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang =
        ref.watch(appSettingProvider.select((setting) => setting.language));
    return _itemMenu(
      title: context.translate.ngonngu,
      value: (lang == 'vi') ? context.translate.vi : context.translate.en,
      onTap: () {
        context.pushNamed(LanguageScreen.nameRoute);
      },
    );
  }
}
