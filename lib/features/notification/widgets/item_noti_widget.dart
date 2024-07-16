part of '../notification_screen.dart';

class _ItemNotiWidget extends ConsumerWidget {
  const _ItemNotiWidget({super.key});

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
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 10,
                children: [
                  Icon(
                    Icons.date_range,
                    color: Theme.of(context).primaryColor,
                    size: 23,
                  ),
                  const Text(
                    '12/07/2024 - 15h30',
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                ],
              ),
              const icons.DoubleCheck(
                color: Colors.green,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Noi dungsdf sdf sdf sdf sdf sfsdf sdfsd fsdf sd fsdf sfsdfdf sd fsf sf dsf sdf f s sfffsd',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
