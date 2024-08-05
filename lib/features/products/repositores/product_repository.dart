import '../../../core/services/dio_client.dart';
import '../../../shared/constants/api_url.dart';

class ProductRepository {
  final DioClient dioClient;

  ProductRepository(this.dioClient);

  Future fetchProducts() async {
    final response = await dioClient.get(ApiUrl.allProduct);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return {};
    }
  }
}
