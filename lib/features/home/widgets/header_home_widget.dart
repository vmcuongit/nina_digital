part of '../home_screen.dart';

class _HeaderHomeWidget extends ConsumerWidget with UiMixins {
  const _HeaderHomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserModel? userInfo =
        ref.watch(authUserProvider.select((value) => value.userLogin));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            context.goNamed(AccountScreen.nameRoute);
          },
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                border: Border.all(color: const Color(0xfff3f3f3))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(55),
              child: (userInfo?.avatar != null)
                  ? Image.network(
                      '${ApiUrl.uploadUser}/${userInfo?.avatar}',
                      width: 55,
                      height: 55,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      MediaAssets.noImage,
                      width: 55,
                      height: 55,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Xin chào',
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              userInfo?.fullname ?? 'Tài khoản',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(top: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  context.pushNamed(NotificationScreen.nameRoute);
                },
                child: customBadgeIcon(context,
                    icon: SvgPicture.asset(
                      '${MediaAssets.icons}/noti.svg',
                      width: 28,
                    ),
                    label: '1'),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  context.pushNamed(ShoppingCartScreen.nameRoute);
                },
                child: customBadgeIcon(context,
                    icon: SvgPicture.asset(
                      '${MediaAssets.icons}/bag.svg',
                      width: 28,
                    ),
                    label: '10'),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
