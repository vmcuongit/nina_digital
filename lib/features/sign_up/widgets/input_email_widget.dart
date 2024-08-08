part of '../sign_up_screen.dart';

class _InputEmailWidget extends ConsumerStatefulWidget {
  const _InputEmailWidget({super.key});

  @override
  ConsumerState createState() => __InputEmailWidgetState();
}

class __InputEmailWidgetState extends ConsumerState<_InputEmailWidget>
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
        hintText: 'Email*',
        prefixIcon: Container(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 2),
          child: icons.Mail(
            color: active,
          ),
        ),
        onChanged: (value) {
          ref.read(formSignUpProvider.notifier).onEmailChange(value);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(errorText: 'Không bỏ trống'),
            FormBuilderValidators.email(
                errorText: 'Email không đúng định dạng'),
          ],
        ),
      ),
    );
  }
}
