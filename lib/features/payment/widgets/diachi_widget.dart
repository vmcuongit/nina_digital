part of '../payment_screen.dart';

class _DiachiWidget extends ConsumerWidget {
  const _DiachiWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Địa chỉ nhận hàng',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 15),
        _wrapContentWidget(
          child: GestureDetector(
            onTap: () {
              print('doi dia chi');
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _customIconWidget(
                  context,
                  child: Icon(
                    Icons.pin_drop,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Text(
                            'Vũ Mạnh Cường',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text('|'),
                          ),
                          Text(
                            '0909 845 849',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '123/234/6 Bình Long , Phường Bình Hưng Hoà A, Quận Bình Tân, TP. Hồ Chí Minh',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                )),
                const SizedBox(width: 15),
                SizedBox(
                  width: 20,
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
