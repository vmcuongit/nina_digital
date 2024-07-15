part of '../product_detail_screen.dart';

class _AddCartWidget extends ConsumerWidget {
  const _AddCartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: MediaQuery.of(context).viewPadding.bottom,
        top: 5,
      ),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xfff2f2f2))),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Số lượng',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 8,
              ),
              _QuantityWidget(),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: FilledButton.icon(
              style: const ButtonStyle(
                padding:
                    WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 12)),
              ),
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag_outlined),
              label: Text(
                'Thêm vào giỏ hàng',
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
