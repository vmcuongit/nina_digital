import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin UiMixins {
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
