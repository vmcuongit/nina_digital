part of '../../order_screen.dart';

class _ListOrderByTypeWidget extends ConsumerWidget {
  const _ListOrderByTypeWidget({super.key, required this.type});

  final int type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return (type == 0 || type == 5)
        ? const _EmptyOrderWidget()
        : ListView.separated(
            key: PageStorageKey(Key('$type')),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 25),
            itemBuilder: (context, index) {
              return const _ItemOrderWidget();
            },
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: 5,
          );
  }
}
