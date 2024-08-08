import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_setttings/app_setting_provider.dart';
import '../../core/authentication_user/model/user_model.dart';
import '../../core/authentication_user/providers/auth_user_provider.dart';
import '../../firebase_api.dart';
import '../../localizations/language_ext.dart';
import '../../shared/app_config.dart';
import '../../shared/constants/api_url.dart';
import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/ui_mixins.dart';
import '../../shared/utils/helper.dart';
import '../notification/notification_screen.dart';
import '../order/order_screen.dart';
import '../profile/profile_screen.dart';
import '../sign_in/sign_in_screen.dart';
import 'address/address_screen.dart';
import 'language/language_screen.dart';
import 'support/support_screen.dart';

part 'widgets/info_account_widget.dart';
part 'widgets/darkmode_widget.dart';
part 'widgets/lang_widget.dart';
part 'widgets/sign_out_widget.dart';

class AccountScreen extends ConsumerWidget with UiMixins {
  const AccountScreen({super.key});

  static const String nameRoute = 'account';
  static const String pathRoute = '/account';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserModel? userInfo =
        ref.watch(authUserProvider.select((value) => value.userLogin));
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: appBarType1(context, text: 'Tài khoản'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            if (userInfo != null) ...[
              const _InfoAccountWidget(),
              const SizedBox(
                height: 10,
              ),
              _itemMenu(
                title: 'Đơn hàng',
                onTap: () {
                  context.pushNamed(OrderScreen.nameRoute);
                },
              ),
              const SizedBox(
                height: 1,
              ),
              _itemMenu(
                title: 'Địa chỉ',
                onTap: () {
                  context.push(AddressScreen.pathRoute);
                },
              ),
              const SizedBox(
                height: 1,
              ),
            ] else ...[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FilledButton(
                    onPressed: () {
                      context.pushNamed(SignInScreen.nameRoute);
                    },
                    child: Text('Đăng nhập')),
              ),
            ],
            _itemMenu(
              title: 'Thông báo',
              onTap: () {
                context.pushNamed(NotificationScreen.nameRoute);
              },
            ),
            const SizedBox(
              height: 1,
            ),
            const _LangWidget(),
            const SizedBox(
              height: 1,
            ),
            const _DarkModeWidget(),
            const SizedBox(
              height: 1,
            ),
            _itemMenu(
              title: 'Trung tâm hỗ trợ',
              onTap: () {
                context.pushNamed(SupportScreen.nameRoute);
              },
            ),
            ListTile(
              title: Text(
                'Phiên bản ${AppConfig.appVersion}',
                style: const TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              title: Theme(
                data: ThemeData(
                    textSelectionTheme: const TextSelectionThemeData()
                        .copyWith(selectionColor: Colors.blue)),
                child: SelectableText(
                  'Device Token ${FirebaseApi.fcmToken}',
                  style: const TextStyle(fontSize: 13),
                  textAlign: TextAlign.center,
                  cursorColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const _SignOutButton(),
          ],
        ),
      ),
    );
  }
}

Widget _itemMenu(
    {required String title,
    Function()? onTap,
    String? value,
    Widget? trailing}) {
  return ListTile(
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        if (value != null) ...[
          Text(
            value,
            style: const TextStyle(color: Colors.black45, fontSize: 14),
          )
        ],
      ],
    ),
    trailing: (trailing != null)
        ? trailing
        : (onTap != null)
            ? Container(
                margin: const EdgeInsets.only(top: 6),
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
              )
            : null,
    tileColor: Colors.white,
    onTap: onTap,
  );
}
