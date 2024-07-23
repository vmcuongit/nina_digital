part of '../payment_screen.dart';

class _VanchuyenWidget extends ConsumerWidget {
  const _VanchuyenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phương thức vận chuyển',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            context.pushNamed(PhuongThucVanChuyenScreen.nameRoute);
          },
          child: _wrapContentWidget(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icons.DeliveryTruck(
                  color: Theme.of(context).primaryColor,
                  width: 40,
                ),
                const SizedBox(width: 15),
                Expanded(child: Text('Chọn phương thức vận chuyển')),
                const SizedBox(width: 15),
                SizedBox(
                  width: 20,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
