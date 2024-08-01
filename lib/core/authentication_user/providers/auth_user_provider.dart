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
    if (await isTokenValid() == false) {
      // accessToken không hợp lệ
      if (await refreshAccessToken() == false) {
        // Làm mới token qua refreshToken
        // nếu Không có token hợp lệ, chuyển đến trang đăng nhập
        signOut();
      }
    }
  }

  Future<String> getAccessToken() async {
    return await _authUserRepository.accessToken ?? '';
  }

  Future<bool> isTokenValid() async {
    final String? accessToken = _authUserRepository.refreshToken;
    return await _authUserRepository.isTokenValid(accessToken);
  }

  Future<dynamic> refreshAccessToken({bool typeString = false}) async {
    final String? refreshToken = _authUserRepository.refreshToken;
    return await _authUserRepository.refreshAccessToken(refreshToken);
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
