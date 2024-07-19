part of '../payment_screen.dart';

Widget _wrapContentWidget({required Widget child}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 3)
      ],
    ),
    child: child,
  );
}
