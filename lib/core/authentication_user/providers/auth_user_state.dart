part of 'auth_user_provider.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  anonymous,
}

class AuthUserState {
  final AuthStatus status;
  final UserModel? userLogin;

  AuthUserState({this.status = AuthStatus.unauthenticated, this.userLogin});

  copyWith({AuthStatus? status, UserModel? userLogin}) {
    return AuthUserState(
      status: status ?? this.status,
      userLogin: userLogin ?? this.userLogin,
    );
  }
}
