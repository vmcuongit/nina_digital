part of '../sign_in_screen.dart';

class _InputPasswordWidget extends ConsumerStatefulWidget {
  const _InputPasswordWidget({super.key});

  @override
  ConsumerState createState() => __InputPasswordWidgetState();
}

class __InputPasswordWidgetState extends ConsumerState<_InputPasswordWidget>
    with FormMixins {
  Color? _active;
  bool _hideText = true;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        if (value) {
          _active = Theme.of(context).primaryColor;
        } else {
          _active = null;
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
            color: _active,
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
            child: (_hideText == false)
                ? const icons.Eye()
                : const icons.EyeClosed(),
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
        onChanged: (value) {
          ref.read(signInProvider.notifier).onChangePassword(value);
        },
      ),
    );
  }
}
