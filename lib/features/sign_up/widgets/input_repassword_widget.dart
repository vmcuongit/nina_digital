part of '../sign_up_screen.dart';

class _InputRepasswordWidget extends ConsumerStatefulWidget {
  const _InputRepasswordWidget({super.key});

  @override
  ConsumerState createState() => __InputRepasswordWidgetState();
}

class __InputRepasswordWidgetState extends ConsumerState<_InputRepasswordWidget>
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
        hintText: 'Nhập lại mật khẩu*',
        prefixIcon: Container(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 2),
          child: icons.Lock(
            color: active,
          ),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(errorText: 'Không bỏ trống'),
            FormBuilderValidators.minLength(6,
                errorText: 'Mật khẩu tối thiểu 6 ký tự'),
          ],
        ),
      ),
    );
  }
}
