part of '../sign_up_screen.dart';

class _InputPhoneWidget extends ConsumerStatefulWidget {
  const _InputPhoneWidget({super.key});

  @override
  ConsumerState createState() => __InputPhoneWidgetState();
}

class __InputPhoneWidgetState extends ConsumerState<_InputPhoneWidget>
    with FormMixins {
  Color? active;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        if (value) {
          active = Theme.of(context).primaryColor;
        } else {
          active = null;
        }
        setState(() {});
      },
      child: customTextFormField(
        context,
        fillColor: _fillColor,
        borderRadius: _borderRadius,
        hintText: 'Số điện thoại*',
        prefixIcon: Container(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 2),
          child: icons.Phone(
            color: active,
          ),
        ),
        onChanged: (value) {
          ref.read(formSignUpProvider.notifier).onPhoneChange(value);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(errorText: 'Không bỏ trống'),
          ],
        ),
      ),
    );
  }
}
