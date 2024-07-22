import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/form_mixin.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../home/home_screen.dart';
import '../sign_up/sign_up_screen.dart';

part 'widgets/input_email_widget.dart';
part 'widgets/input_password_widget.dart';

final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();

const Color _fillColor = Color(0xffF4F4F4);
const double _borderRadius = 30;

class SignInScreen extends ConsumerWidget with FormMixins {
  const SignInScreen({super.key});

  static const String nameRoute = 'sign-in';
  static const String pathRoute = '/sign-in';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 30),
            width: double.infinity,
            child: Form(
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
                  _InputPasswordWidget(),
                  const SizedBox(
                    height: 25,
                  ),
                  customButton(
                    context,
                    background: Theme.of(context).primaryColor,
                    text: 'Đăng nhập',
                    textColor: Colors.white,
                    onTap: () {
                      _onDangNhap(context);
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
                          style:
                              TextStyle(color: Color(0xff888888), fontSize: 14),
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
            ),
          ),
        ),
      ),
    );
  }
}

_onDangNhap(BuildContext context) {
  if (_formSignInKey.currentState!.validate() == true) {
    context.go(HomeScreen.pathRoute);
  }
}
