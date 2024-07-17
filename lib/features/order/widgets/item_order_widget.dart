part of '../order_screen.dart';

class _ItemOrderWidget extends ConsumerWidget {
  const _ItemOrderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(OrderDetailScreen.nameRoute,
            pathParameters: {'code': '1234'});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        margin: const EdgeInsets.symmetric(horizontal: 20),
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xfff2f2f2))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    decoration: const BoxDecoration(
                        color: Color(0xffE7E7E7),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      'Đang vận chuyển',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Text(
                    '15-07-2024 15h30',
                    style: TextStyle(fontSize: 11, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                  margin: const EdgeInsets.only(right: 15),
                  child: Image.asset(
                    '${MediaAssets.images}/sp.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'iPhone 14 Pro Max 128Gb',
                        style: TextStyle(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Màu: Gold',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          Text(
                            'Số lượng: 2',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '135.000.000đ',
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          ),
                          SizedBox(
                            width: 80,
                            height: 32,
                            child: FilledButton(
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10)),
                              ),
                              onPressed: () {
                                context.pushNamed(OrderDetailScreen.nameRoute,
                                    pathParameters: {'code': '1234'});
                              },
                              child: Text(
                                'Chi tiết',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
