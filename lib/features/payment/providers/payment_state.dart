part of 'payment_provider.dart';

class PaymentState {
  final FormStatus formStatus;

  PaymentState({this.formStatus = FormStatus.pure});

  copyWith({FormStatus? formStatus}) {
    return PaymentState(
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
