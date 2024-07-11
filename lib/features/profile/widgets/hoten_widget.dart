part of '../profile_screen.dart';

class _HotenWidget extends ConsumerWidget with FormMixins {
  const _HotenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return customTextFormField(
      context,
      labelText: 'Họ Tên',
      labelStyle: _labelStyle,
      initialValue: 'Vũ Mạnh Cường',
      fillColor: _fillColor,
      contentPadding: _contentPadding,
    );
  }
}
