part of 'form_signup_provider.dart';

class FormSignUpState {
  final FormStatus? formStatus;
  final String? email;
  final String? phone;
  final String? password;
  final String? rePassword;
  final String? message;

  FormSignUpState(
      {this.formStatus,
      this.email,
      this.phone,
      this.password,
      this.rePassword,
      this.message});

  copyWith(
      {FormStatus? formStatus,
      String? email,
      String? phone,
      String? password,
      String? rePassword,
      String? message}) {
    return FormSignUpState(
        formStatus: formStatus ?? this.formStatus,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword,
        message: message ?? this.message);
  }

  toJson() {
    return {'email': email, 'phone': phone, 'password': password};
  }
}
