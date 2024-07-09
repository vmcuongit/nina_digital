part of '../forgot_password_screen.dart';

class _CaptchaInputWidget extends ConsumerStatefulWidget {
  const _CaptchaInputWidget({super.key});

  @override
  ConsumerState createState() => __CaptchaInputWidgetState();
}

class __CaptchaInputWidgetState extends ConsumerState<_CaptchaInputWidget> {
  String randomString = '';
  bool isVerified = false;
  TextEditingController controller = TextEditingController();

  void _buildCaptcha() {
    const letters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    const length = 6;
    final random = Random();
    randomString = String.fromCharCodes(List.generate(
        length, (index) => letters.codeUnitAt(random.nextInt(letters.length))));
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
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Mã bảo vệ',
              prefixIcon: Icon(Icons.safety_check_outlined),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(errorText: 'Bắt buộc nhập.'),
                (value) {
                  if (value != randomString) {
                    return 'Mã bảo vệ không đúng';
                  }
                }
              ],
            ),
            onChanged: (value) {},
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
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              randomString,
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
              icon: const Icon(
                Icons.refresh,
              )),
        ),
      ],
    );
  }
}
