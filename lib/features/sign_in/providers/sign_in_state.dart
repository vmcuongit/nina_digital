part of 'sign_in_provider.dart';

class SignInState {
  final FormStatus formStatus;
  final String? email;
  final String? password;
  final String? message;

  SignInState(
      {this.formStatus = FormStatus.pure,
      this.email,
      this.password,
      this.message});

  copyWith(
      {FormStatus? formStatus,
      String? email,
      String? password,
      String? message}) {
    return SignInState(
      formStatus: formStatus ?? this.formStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
    );
  }

  toJson() {
    return {'email': email, 'password': password};
  }
}
