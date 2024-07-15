import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offset_scroll_provider.g.dart';

@riverpod
class OffsetScrollProductDetail extends _$OffsetScrollProductDetail {
  @override
  bool build() {
    return false;
  }

  update(bool value) {
    state = value;
  }
}
