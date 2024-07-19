part of '../payment_screen.dart';

class _ItemCartWidget extends ConsumerWidget {
  const _ItemCartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: const Color(0xfff2f2f2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Container(
              width: 90,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(right: 15),
              child: Image.asset(
                '${MediaAssets.images}/sp.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'iPhone 14 Pro Max 128Gb',
                  style: TextStyle(fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Màu: Gold',
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '35.000.000đ',
                      style: TextStyle(fontSize: 17, color: Colors.red),
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xfff3f3f3),
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 13),
                      ),
                      minRadius: 15,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
