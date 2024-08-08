part of '../sign_up_screen.dart';

class _FormWidget extends ConsumerWidget with FormMixins {
  const _FormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      formSignUpProvider,
      (previous, next) {
        if (previous?.formStatus != next.formStatus) {
          if (next.formStatus == FormStatus.submissionInProgress) {
            Loading(context).start();
          }
          if (next.formStatus == FormStatus.submissionFailure) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.scale,
              title: 'THÔNG BÁO',
              desc: next.message,
              btnOkOnPress: () {},
            ).show();
            Loading(context).stop();
          }
          if (next.formStatus == FormStatus.submissionSuccess) {
            Loading(context).stop();
            context.goNamed(SignInScreen.nameRoute);
          }
        }
      },
    );

    return Form(
      key: _formSignUpKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('${MediaAssets.images}/logo.png'),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Đăng ký tài khoản",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 50,
          ),
          const _InputEmailWidget(),
          const SizedBox(
            height: 15,
          ),
          const _InputPhoneWidget(),
          const SizedBox(
            height: 15,
          ),
          const _InputPasswordWidget(),
          const SizedBox(
            height: 15,
          ),
          const _InputRepasswordWidget(),
          const SizedBox(
            height: 25,
          ),
          customButton(
            context,
            background: Theme.of(context).primaryColor,
            text: 'Đăng ký',
            textColor: Colors.white,
            onTap: () {
              _onDangKy(ref);
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Divider(
                      height: 1,
                      color: Color(0xffEBEBEB),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Hoặc tiếp tục với',
                  style: TextStyle(color: Color(0xff888888), fontSize: 14),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Divider(
                      height: 1,
                      color: Color(0xffEBEBEB),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customButton(
                context,
                image: Image.asset('${MediaAssets.images}/icon_fb.png'),
                onTap: () {},
              ),
              const SizedBox(
                width: 10,
              ),
              customButton(
                context,
                image: Image.asset('${MediaAssets.images}/icon_gg.png'),
                onTap: () {},
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bạn đã có tài khoản?',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    context.go(SignInScreen.pathRoute);
                  },
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
