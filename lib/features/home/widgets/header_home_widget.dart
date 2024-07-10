part of '../home_screen.dart';

class _HeaderHomeWidget extends StatelessWidget with UiMixins {
  const _HeaderHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 55,
          height: 55,
          child: CircleAvatar(
            maxRadius: 55,
            minRadius: 55,
            child: Image.asset(
              '${MediaAssets.images}/avatar.jpg',
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Vu Manh Cuong',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                onTap: () {},
                child: customBadgeIcon(context,
                    icon: SvgPicture.asset(
                      '${MediaAssets.icons}/noti.svg',
                      width: 32,
                    ),
                    label: null),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {},
                child: customBadgeIcon(context,
                    icon: SvgPicture.asset(
                      '${MediaAssets.icons}/bag.svg',
                      width: 32,
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
