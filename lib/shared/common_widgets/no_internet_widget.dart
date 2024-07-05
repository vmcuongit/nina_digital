import 'package:flutter/material.dart';

import '../../localizations/language_ext.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
      ),
      child: Center(
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            child: Text(
              context.translate.no_internet,
              style: const TextStyle(color: Colors.black54),
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
