part of '../sign_up_screen.dart';

class _InputPasswordWidget extends ConsumerStatefulWidget {
  const _InputPasswordWidget({super.key});

  @override
  ConsumerState createState() => __InputPasswordWidgetState();
}

class __InputPasswordWidgetState extends ConsumerState<_InputPasswordWidget>
    with FormMixins {
  Color? active;
  bool _hideText = true;

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
        hintText: 'Mật khẩu*',
        prefixIcon: Container(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 2),
          child: icons.Lock(
            color: active,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _hideText = !_hideText;
            });
          },
          child: Container(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 2),
            child: (_hideText == false) ? icons.Eye() : icons.EyeClosed(),
          ),
        ),
        obscureText: _hideText,
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
