part of '../account_screen.dart';

class _DarkModeWidget extends ConsumerWidget {
  const _DarkModeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme =
        ref.watch(appSettingProvider.select((setting) => setting.theme));
    return _itemMenu(
      title: 'Giao diện tối',
      trailing: Switch.adaptive(
        activeColor: Theme.of(context).primaryColor,
        value: (theme == 'light') ? false : true,
        onChanged: (value) {
          ref
              .read(appSettingProvider.notifier)
              .changeTheme(theme: (theme == 'light') ? 'dark' : 'light');
        },
      ),
    );
  }
}
