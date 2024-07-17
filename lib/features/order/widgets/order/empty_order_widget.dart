part of '../../order_screen.dart';

class _EmptyOrderWidget extends StatelessWidget {
  const _EmptyOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '${MediaAssets.images}/not_found.png',
            fit: BoxFit.fitHeight,
            height: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Bạn chưa có đơn hàng nào',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
