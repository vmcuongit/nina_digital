import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../shared/app_config.dart';
import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/form_mixin.dart';
import '../../shared/utils/form_status.dart';
import '../../shared/utils/helper.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../sign_up/sign_up_screen.dart';
import 'providers/sign_in_provider.dart';

part 'widgets/form_signin_widget.dart';
part 'widgets/input_email_widget.dart';
part 'widgets/input_password_widget.dart';

final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();

const Color _fillColor = Color(0xffF4F4F4);
const double _borderRadius = 30;

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const String nameRoute = 'sign-in';
  static const String pathRoute = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 30),
            width: double.infinity,
            child: const _FormSigninWidget(),
          ),
        ),
      ),
    );
  }
}

_onDangNhap(BuildContext context, WidgetRef ref) {
  if (_formSignInKey.currentState!.validate() == true) {
    ref.read(signInProvider.notifier).signIn();
  }
  return false;
}
