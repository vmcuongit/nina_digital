import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/form_mixin.dart';
import '../../shared/utils/form_status.dart';
import '../../shared/utils/helper.dart';
import '../sign_in/sign_in_screen.dart';
import 'providers/form_signup_provider.dart';

part 'widgets/input_email_widget.dart';
part 'widgets/input_phone_widget.dart';
part 'widgets/input_password_widget.dart';
part 'widgets/input_repassword_widget.dart';
part 'widgets/form_signup_widget.dart';

final GlobalKey<FormState> _formSignUpKey = GlobalKey<FormState>();

const Color _fillColor = Color(0xffF4F4F4);
const double _borderRadius = 30;

class SignUpScreen extends ConsumerWidget with FormMixins {
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
            child: const _FormSignUpWidget(),
          ),
        ),
      ),
    );
  }
}

Function()? _onDangKy(WidgetRef ref) {
  if (_formSignUpKey.currentState!.validate() == true) {
    ref.read(formSignUpProvider.notifier).submit();
  }
  return null;
}
