import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offset_scroll_provider.g.dart';

@riverpod
class OffsetScroll extends _$OffsetScroll {
  @override
  bool build() {
    return false;
  }

  update(bool value) {
    state = value;
  }
}
