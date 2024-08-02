part of '../sign_in_screen.dart';

class _FormSigninWidget extends ConsumerWidget with FormMixins {
  const _FormSigninWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      signInProvider,
      (previous, next) {
        if (previous?.formStatus != next.formStatus) {
          if (next.formStatus == FormStatus.submissionInProgress) {
            Loading(context).start();
          }
          if (next.formStatus == FormStatus.submissionFailure) {
            Loading(context).stop();
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.scale,
              title: 'THÔNG BÁO',
              desc: next.message,
              btnOkOnPress: () {},
            ).show();
          }
          if (next.formStatus == FormStatus.submissionSuccess) {
            Loading(context).stop();
            context.go(AppConfig.initialPath);
          }
        }
      },
    );

    return Form(
      key: _formSignInKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('${MediaAssets.images}/logo.png'),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Đăng nhập",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 50,
          ),
          const _InputEmailWidget(),
          const SizedBox(
            height: 15,
          ),
          const _InputPasswordWidget(),
          const SizedBox(
            height: 25,
          ),
          customButton(
            context,
            background: Theme.of(context).primaryColor,
            text: 'Đăng nhập',
            textColor: Colors.white,
            onTap: () {
              _onDangNhap(context, ref);
            },
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {
              context.push(ForgotPasswordScreen.pathRoute);
            },
            child: Text('Quên mật khẩu ?'),
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
                  'Bạn chưa có tài khoản?',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    context.go(SignUpScreen.pathRoute);
                  },
                  child: Text(
                    'Đăng ký',
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
