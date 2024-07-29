part of 'auth_user_provider.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  anonymous,
}

class AuthUserState {
  final AuthStatus status;
  final Map<String, dynamic>? userLogin;
  final String? message;

  AuthUserState(
      {this.status = AuthStatus.unauthenticated, this.userLogin, this.message});

  copyWith(
      {AuthStatus? status, Map<String, dynamic>? userLogin, String? message}) {
    return AuthUserState(
        status: status ?? this.status,
        userLogin: userLogin ?? this.userLogin,
        message: message ?? this.message);
  }
}
