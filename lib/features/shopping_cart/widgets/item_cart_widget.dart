part of '../shopping_cart_screen.dart';

class _ItemCartWidget extends ConsumerWidget {
  const _ItemCartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Container(
              width: 110,
              height: 110,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              margin: const EdgeInsets.only(right: 15),
              child: Image.asset(
                '${MediaAssets.images}/sp.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text(
                        'iPhone 14 Pro Max 128Gb',
                        style: TextStyle(fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      width: 25,
                      child: GestureDetector(
                        onTap: () {},
                        child: const icons.Trash(
                          width: 23,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
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
                    _QuantityWidget(),
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

class _QuantityWidget extends ConsumerStatefulWidget {
  const _QuantityWidget({super.key});

  @override
  ConsumerState createState() => __QuantityWidgetState();
}

class __QuantityWidgetState extends ConsumerState<_QuantityWidget> {
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 40,
      decoration: BoxDecoration(
          color: const Color(0xffF4F4F4),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(color: const Color(0xffE8E8E8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 30,
            child: IconButton(
              icon: const Icon(
                Icons.remove,
                size: 16,
              ),
              onPressed: () {
                if (_qty > 1) {
                  _qty--;
                  setState(() {});
                }
              },
            ),
          ),
          Text(
            _qty.toString(),
            style: const TextStyle(fontSize: 14),
          ),
          SizedBox(
            width: 30,
            child: IconButton(
              icon: const Icon(
                Icons.add,
                size: 16,
              ),
              onPressed: () {
                _qty++;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
