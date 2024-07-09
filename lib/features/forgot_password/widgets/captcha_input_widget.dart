part of '../forgot_password_screen.dart';

class _CaptchaInputWidget extends ConsumerStatefulWidget {
  const _CaptchaInputWidget({super.key});

  @override
  ConsumerState createState() => __CaptchaInputWidgetState();
}

class __CaptchaInputWidgetState extends ConsumerState<_CaptchaInputWidget>
    with FormMixins {
  String _randomString = '';

  void _buildCaptcha() {
    _randomString = Helper.generateUniqueString(maxLength: 6);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _buildCaptcha();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: customTextFormField(
            context,
            borderRadius: _borderRadius,
            prefixIcon: const Icon(Icons.safety_check_outlined),
            hintText: 'Mã bảo vệ',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(errorText: 'Không bỏ trống'),
                (value) {
                  if (value != _randomString) {
                    return 'Mã bảo vệ không đúng';
                  }
                }
              ],
            ),
            onFieldSubmitted: (value) {
              _submitForm(ref);
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // Shown Captcha value to user
        Container(
            width: 120,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              _randomString,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoCondensed(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              ),
            )),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 30,
          margin: const EdgeInsets.only(top: 4),
          child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                _buildCaptcha();
              },
              icon: const Icon(Icons.refresh)),
        ),
      ],
    );
  }
}
