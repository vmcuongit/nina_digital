part of '../payment_screen.dart';

Widget _customIconWidget(BuildContext context, {required Widget child}) {
  return Container(
    padding: const EdgeInsets.all(7),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(80),
    ),
    child: Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(child: child),
    ),
  );
}
