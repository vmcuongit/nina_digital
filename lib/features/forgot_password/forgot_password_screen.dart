import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/form_mixin.dart';

part 'widgets/captcha_input_widget.dart';
part 'widgets/input_email_widget.dart';

final GlobalKey<FormState> _keyFormForgot = GlobalKey<FormState>();

const double _borderRadius = 10;

final class ForgotPasswordScreen extends ConsumerWidget with FormMixins {
  const ForgotPasswordScreen({super.key});

  static const String nameRoute = 'forgot-password';
  static const String pathRoute = '/forgot-password';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quên mật khẩu'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _keyFormForgot,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('${MediaAssets.images}/auth_quenmk.png'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Nhập Email mà bạn đã đăng ký để thực hiện đặt lại mật khẩu',
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 30,
                ),
                const _InputEmailWidget(),
                const SizedBox(
                  height: 15,
                ),
                const _CaptchaInputWidget(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // width: double.infinity,
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: customButton(
          context,
          background: Theme.of(context).primaryColor,
          text: 'Xác nhận',
          textColor: Colors.white,
          onTap: () {
            _submitForm(ref);
          },
        ),
      ),
    );
  }
}

_submitForm(WidgetRef ref) {
  if (_keyFormForgot.currentState?.validate() == true) {}
  return false;
}
