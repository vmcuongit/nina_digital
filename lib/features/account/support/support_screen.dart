import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  static const String nameRoute = 'support';
  static const String pathRoute = 'support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trung tâm hỗ trợ'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            _itemSupport(
              context,
              icon: icons.HeadsetHelp(
                color: Theme.of(context).primaryColor,
                width: 32,
              ),
              text: 'Chat với tư vấn viên',
              onTap: () {},
            ),
            _itemSupport(
              context,
              icon: icons.Internet(
                color: Theme.of(context).primaryColor,
                width: 32,
              ),
              text: 'Website',
              onTap: () {},
            ),
            _itemSupport(
              context,
              icon: Icon(
                Icons.facebook,
                color: Theme.of(context).primaryColor,
                size: 35,
              ),
              text: 'Facebook',
              onTap: () {},
            ),
            _itemSupport(
              context,
              icon: icons.Instagram(
                color: Theme.of(context).primaryColor,
                width: 32,
              ),
              text: 'Instagram',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  _itemSupport(BuildContext context,
      {Function()? onTap, required String text, required Widget icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
              ),
            ]),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
