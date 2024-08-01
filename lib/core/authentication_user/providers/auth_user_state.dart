part of 'auth_user_provider.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  anonymous,
}

class AuthUserState {
  final AuthStatus status;
  final Map<String, dynamic>? userLogin;

  AuthUserState({this.status = AuthStatus.unauthenticated, this.userLogin});

  copyWith({AuthStatus? status, Map<String, dynamic>? userLogin}) {
    return AuthUserState(
        status: status ?? this.status, userLogin: userLogin ?? this.userLogin);
  }
}
