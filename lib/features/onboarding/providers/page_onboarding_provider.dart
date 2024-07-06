import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_onboarding_provider.g.dart';

@riverpod
class PageOnboarding extends _$PageOnboarding {
  @override
  int build() {
    return 0;
  }

  void updatePage({required int currentPage}) {
    state = currentPage;
  }
}
