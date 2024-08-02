part of '../account_screen.dart';

class _SignOutButton extends ConsumerWidget {
  const _SignOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(authUserProvider.select(
      (value) => value.userLogin,
    ));
    return (userInfo != null && userInfo.isNotEmpty)
        ? ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Đăng xuất',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
            tileColor: Colors.white,
            onTap: () {
              ref.read(authUserProvider.notifier).signOut();
            },
          )
        : const SizedBox.shrink();
  }
}
