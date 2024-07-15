import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../constants/media_assets.dart';

mixin UiMixins {
  PreferredSizeWidget? appBarType1(BuildContext context,
      {required String text}) {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            '${MediaAssets.images}/logo.png',
            height: 35,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(text),
        ],
      ),
      centerTitle: false,
    );
  }

  Widget showStar({required int number, double? size}) {
    return Row(
      children: List.generate(
        5,
        (index) {
          return ((index + 1) <= number)
              ? icons.StarSolid(
                  color: const Color(0xffFFC833),
                  height: size,
                )
              : icons.Star(
                  color: Colors.grey,
                  height: size,
                );
        },
      ),
    );
  }

  Widget customBadgeIcon(
    BuildContext context, {
    required Widget icon,
    String? label,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        icon,
        if (label != null) ...[
          Positioned(
              top: -12,
              right: -7,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    label,
                    style: GoogleFonts.roboto()
                        .copyWith(fontSize: 13, color: Colors.white),
                  ),
                ),
              )),
        ],
      ],
    );
  }
}
