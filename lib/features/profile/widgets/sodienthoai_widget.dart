part of '../profile_screen.dart';

class _SoDienThoaiWidget extends ConsumerWidget with FormMixins {
  const _SoDienThoaiWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return customTextFormField(
      context,
      labelText: 'Điện thoại',
      labelStyle: _labelStyle,
      initialValue: '0909 845 849',
      fillColor: _fillColor,
      contentPadding: _contentPadding,
    );
  }
}
