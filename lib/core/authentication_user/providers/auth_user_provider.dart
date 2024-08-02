import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/auth_user_repository.dart';

part 'auth_user_provider.g.dart';
part 'auth_user_state.dart';

@Riverpod(keepAlive: true)
class AuthUser extends _$AuthUser {
  late final AuthUserRepository _authUserRepository;

  @override
  AuthUserState build() {
    _authUserRepository = ref.watch(authUserRepositoryProvider);
    return AuthUserState();
  }

  Future<void> init() async {
    await _authUserRepository.initData();
    await checkSignIn();
  }

  Future<void> checkSignIn() async {
    if (await isTokenValid()) {
      await _signInContinue();
    } else if (await refreshAccessToken()) {
      await _signInContinue();
    } else {
      // Đăng xuất
      signOut();
    }
  }

  Future<void> _signInContinue() async {
    state = state.copyWith(
      status: AuthStatus.authenticated,
      userLogin: (_authUserRepository.userLogin != '' &&
              _authUserRepository.userLogin != null)
          ? jsonDecode(_authUserRepository.userLogin.toString())
          : {},
    );
  }

  String getAccessToken() {
    return _authUserRepository.accessToken ?? '';
  }

  Future<bool> isTokenValid() async {
    final String? accessToken = _authUserRepository.accessToken;
    if (accessToken != null && accessToken != '') {
      return await _authUserRepository.isTokenValid(accessToken);
    }
    return false;
  }

  Future<dynamic> refreshAccessToken({bool typeString = false}) async {
    final String? refreshToken = _authUserRepository.refreshToken;
    if (refreshToken != null && refreshToken != '') {
      return await _authUserRepository.refreshAccessToken(refreshToken,
          typeString: typeString);
    }
    return false;
  }

  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> data}) async {
    final response = await _authUserRepository.signIn(data: data);
    if (response['status'] == 'success') {
      state = AuthUserState(
        status: AuthStatus.authenticated,
        userLogin: response['data'],
      );
    } else {
      state = AuthUserState(
        status: AuthStatus.unauthenticated,
        userLogin: {},
      );
    }
    return response;
  }

  void signOut() {
    _authUserRepository.clearToken();
    state = AuthUserState(status: AuthStatus.unauthenticated, userLogin: {});
  }
}
