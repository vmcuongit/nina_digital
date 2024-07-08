import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/ui_mixin.dart';
import '../sign_in/sign_in_screen.dart';

part 'widgets/input_email_widget.dart';
part 'widgets/input_phone_widget.dart';
part 'widgets/input_password_widget.dart';
part 'widgets/input_repassword_widget.dart';

final GlobalKey<FormState> _formSignUpKey = GlobalKey<FormState>();

const Color _fillColor = Color(0xffF4F4F4);
const double _borderRadius = 30;

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  static const String nameRoute = 'sign-up';
  static const String pathRoute = '/sign-up';

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
                  _ButtonLoginWith(
                    background: Theme.of(context).primaryColor,
                    text: 'Đăng ký',
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white, fontSize: 15),
                    onTap: _onDangKy,
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
                      _ButtonLoginWith(
                        image: '${MediaAssets.images}/icon_fb.png',
                        onTap: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      _ButtonLoginWith(
                        image: '${MediaAssets.images}/icon_gg.png',
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
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonLoginWith extends ConsumerWidget {
  const _ButtonLoginWith(
      {super.key,
      this.image,
      this.text,
      this.background,
      this.textStyle,
      this.onTap});

  final String? image;
  final String? text;
  final Color? background;
  final TextStyle? textStyle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        decoration: BoxDecoration(
          color: background,
          border: Border.all(color: const Color(0xffEBEBEB)),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image != null) ...[
              Image.asset(image.toString()),
            ],
            if (text != null) ...[
              Text(
                text.toString(),
                style: textStyle ?? Theme.of(context).textTheme.titleSmall,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

Function()? _onDangKy() {
  if (_formSignUpKey.currentState!.validate() == true) {
    print('ok');
  }
  return null;
}
