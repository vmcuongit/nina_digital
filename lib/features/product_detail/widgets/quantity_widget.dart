part of '../product_detail_screen.dart';

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
      width: 120,
      decoration: BoxDecoration(
          color: const Color(0xffF4F4F4),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: const Color(0xffE8E8E8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(
              Icons.remove,
              size: 18,
            ),
            onPressed: () {
              if (_qty > 1) {
                _qty--;
                setState(() {});
              }
            },
          ),
          Text(
            _qty.toString(),
            style: const TextStyle(fontSize: 16),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 18,
            ),
            onPressed: () {
              _qty++;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
