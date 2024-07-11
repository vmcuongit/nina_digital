import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/mixins/form_mixin.dart';
import '../../../shared/utils/helper.dart';

part 'widgets/hoten_widget.dart';
part 'widgets/email_widget.dart';
part 'widgets/sodienthoai_widget.dart';
part 'widgets/ngaysinh_widget.dart';
part 'widgets/gioitinh_widget.dart';

final GlobalKey<FormState> _keyFormProfile = GlobalKey<FormState>();

const _labelStyle = TextStyle(fontSize: 15);
const _fillColor = Color(0xffF5F5F5);
const _contentPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 18);

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  static const String nameRoute = 'profile';
  static const String pathRoute = '/profile';

  @override
  ConsumerState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> with FormMixins {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin tài khoản'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
          child: Form(
            key: _keyFormProfile,
            child: const Column(
              children: [
                _HotenWidget(),
                SizedBox(height: 25),
                _EmailWidget(),
                SizedBox(height: 25),
                _SoDienThoaiWidget(),
                SizedBox(height: 25),
                _NgaySinhWidget(),
                SizedBox(height: 25),
                _GioiTinhWidget(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewPadding.bottom),
        child: customButton(
          context,
          text: 'Cập nhật',
          background: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onTap: () => _capNhatThongTin(ref),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

_capNhatThongTin(WidgetRef ref) {
  if (_keyFormProfile.currentState?.validate() == true) {
    print('OK');
  }
}
