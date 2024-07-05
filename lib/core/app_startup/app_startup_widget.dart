import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/common_widgets/app_loading_widget.dart';
import '../main_app.dart';
import 'app_startup_error_widget.dart';
import 'app_startup_provider.dart';

class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      data: (_) => const MainApp(),
      loading: () => const AppLoadingWidget(),
      error: (e, st) => AppStartupErrorWidget(
        message: e.toString(),
      ),
    );
  }
}
