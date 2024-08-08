import '../../../core/services/dio_client.dart';
import '../../../shared/constants/api_url.dart';

class SignupRepository {
  late final DioClient _dioClient;

  SignupRepository(this._dioClient);

  Future<Map> SignUp({required Map<String, dynamic> data}) async {
    print(data);
    final response = await _dioClient.post(ApiUrl.signUp, data: data);
    if (response.statusCode == 200) {
      return response.data;
    }
    return {'status': 'error', 'message': 'Lỗi hệ thống'};
  }
}
