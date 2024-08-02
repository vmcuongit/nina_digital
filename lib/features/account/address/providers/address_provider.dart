import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/dio_client.dart';
import '../../../../shared/constants/api_url.dart';

part 'address_provider.g.dart';

@riverpod
class Address extends _$Address {
  late final DioClient _dioClient;

  @override
  Map build() {
    _dioClient = ref.watch(dioProvider);
    return {};
  }

  createAddress() async {
    final data = {
      'name_address': 'cong ty 3',
      'name_recipient': 'dvdkhoa',
      'phone_recipient': "093498y91",
      'id_city': 0,
      'id_district': 0,
      'id_ward': 0,
      'detail_address': 'dahfjshfj',
      'is_default': 0
    };
    final Response res = await _dioClient.post(ApiUrl.address, data: data);
    if (res.statusCode == 200) {
      print(res.data);
    } else {
      print(res.data);
    }
  }
}
