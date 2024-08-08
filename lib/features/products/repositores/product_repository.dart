import '../../../core/services/dio_client.dart';
import '../../../shared/constants/api_url.dart';

class ProductRepository {
  final DioClient dioClient;

  ProductRepository(this.dioClient);

  Future fetchProducts({int currentPage = 1, int limit = 10}) async {
    final response = await dioClient
        .get('${ApiUrl.allProduct}?page=$currentPage&limit=$limit');
    if (response.statusCode == 200) {
      if (response.data['status'] == 'success') {
        return response.data;
      }
    }
    return null;
  }
}
