import 'package:dio/dio.dart';

import '../../../core/services/dio_client.dart';
import '../../../shared/constants/api_url.dart';

class ProductRepository {
  final DioClient _dioClient = DioClient(Dio());

  Future fetchProducts() async {
    Response response = await _dioClient.get(ApiUrl.allProduct);
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
