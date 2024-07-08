import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../../shared/constants/media_assets.dart';

class IndexAuthScreen extends ConsumerWidget {
  const IndexAuthScreen({super.key});

  static const String nameRoute = 'intro_auth';
  static const String pathRoute = '/intro-auth';

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
                  title: 'Tiếp tục với Facebook',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 19,
                ),
                _ButtonLoginWith(
                  image: '${MediaAssets.images}/icon_gg.png',
                  title: 'Tiếp tục với Google',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: icons.Lock(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: icons.Lock(),
                    ),
                  ),
                )
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
      {super.key, required this.image, required this.title, this.onTap});

  final String image;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
