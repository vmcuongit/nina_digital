import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/constants/media_assets.dart';
import '../sign_in/sign_in_screen.dart';
import '../sign_up/sign_up_screen.dart';

class IntroAuthScreen extends ConsumerWidget {
  const IntroAuthScreen({super.key});

  static const String nameRoute = 'index-auth';
  static const String pathRoute = '/index-auth';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 30),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('${MediaAssets.images}/index_auth.png'),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Let's you in",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 50,
                ),
                _ButtonLoginWith(
                  image: '${MediaAssets.images}/icon_fb.png',
                  text: 'Tiếp tục với Facebook',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 19,
                ),
                _ButtonLoginWith(
                  image: '${MediaAssets.images}/icon_gg.png',
                  text: 'Tiếp tục với Google',
                  onTap: () {},
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
                        'Hoặc',
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
                _ButtonLoginWith(
                  background: Theme.of(context).primaryColor,
                  text: 'Đăng nhập bằng mật khẩu',
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white, fontSize: 15),
                  onTap: () {
                    context.go(SignInScreen.pathRoute);
                  },
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
    );
  }
}

class _ButtonLoginWith extends ConsumerWidget {
  const _ButtonLoginWith(
      {super.key,
      this.image,
      required this.text,
      this.background,
      this.textStyle,
      this.onTap});

  final String? image;
  final String text;
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
              const SizedBox(
                width: 10,
              ),
            ],
            Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
