part of '../profile_screen.dart';

class _EmailWidget extends ConsumerWidget with FormMixins {
  const _EmailWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return customTextFormField(
      context,
      labelText: 'Email',
      labelStyle: _labelStyle,
      initialValue: 'vmcuongnina@gmail.com',
      enabled: false,
      fillColor: _fillColor,
      contentPadding: _contentPadding,
    );
  }
}
