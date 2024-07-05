import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WidgetWithRole extends ConsumerWidget {
  const WidgetWithRole(
      {super.key,
      required this.child,
      required this.rolePath,
      this.notAllowedWidget});

  final Widget child;
  final String rolePath;
  final Widget? notAllowedWidget;

  // bool isAllowed(WidgetRef ref) {
  //   final AuthState authState = ref.watch(authProvider);
  //   if (authState.userLogin != null && authState.userLogin?.role == 'Admin') {
  //     return true;
  //   }
  //
  //   final List<String>? quyens = (authState.userLogin?.l1_groupId != null)
  //       ? authState.userLogin?.l1_groupId?.quyenhan?.split(',')
  //       : [];
  //   if (quyens!.contains(rolePath)) {
  //     return true;
  //   }
  //   return false;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if (isAllowed(ref)) {
    //   return child;
    // }
    // return notAllowedWidget ?? Container();
    return child;
  }
}
