import '../../../core/services/dio_client.dart';
import '../../../shared/constants/api_url.dart';

class PaymentRepository {
  final DioClient _dioClient;

  PaymentRepository(this._dioClient);

  Future<void> createOrder({required Map data}) async {
    final result = await _dioClient.post(ApiUrl.createOrder, data: data);
    print(result);
  }
}
