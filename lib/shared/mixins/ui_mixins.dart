import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../constants/media_assets.dart';
import '../extensions/context_ext.dart';

mixin UiMixins {
  PreferredSizeWidget? appBarType1(BuildContext context,
      {required String text, Color? backgroundColor, Color? textColor}) {
    return AppBar(
      backgroundColor: backgroundColor,
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
          Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
      centerTitle: false,
    );
  }

  Widget customButtonBottomNavigationBarTypeRadius(BuildContext context,
      {Function()? onPressed, required String text}) {
    return Container(
      padding: EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: context.getViewPaddingBottom(),
        top: 20,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 40,
              spreadRadius: 4,
            ),
          ]),
      child: FilledButton(
        style: const ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 15)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ))),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
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
