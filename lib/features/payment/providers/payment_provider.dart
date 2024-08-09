import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/dio_client.dart';
import '../../../shared/utils/form_status.dart';
import '../repositories/payment_repository.dart';

part 'payment_state.dart';
part 'payment_provider.g.dart';

@riverpod
class Payment extends _$Payment {
  late final PaymentRepository _paymentRepository;
  @override
  PaymentState build() {
    _paymentRepository = PaymentRepository(ref.watch(dioProvider));
    return PaymentState();
  }

  Future<void> createOrder() async {
    final dataFake = {
      "id_user": 117,
      "fullname": "Đặng Văn Đăng Khoa",
      "phone": "0909121111",
      "address": "Sdfsdf",
      "email": "khoa@gmail.com",
      "temp_price": 6304000,
      "total_price": 6304000
    };
    await _paymentRepository.createOrder(data: dataFake);
  }
}
