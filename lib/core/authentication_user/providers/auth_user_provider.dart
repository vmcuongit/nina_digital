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

  Future<void> checkSignIn() async {
    final String accessToken = await _authUserRepository.getAccessToken();
    final String refreshToken = await _authUserRepository.getRefreshToken();
    if (accessToken != '' && await isTokenValid(accessToken)) {
      // Token còn hợp lệ, chuyển đến trang chính
    } else if (refreshToken != '' && await refreshAccessToken(refreshToken)) {
      // Làm mới token thành công, chuyển đến trang chính
    } else {
      // Không có token hợp lệ, chuyển đến trang đăng nhập
      state = AuthUserState(
          status: AuthStatus.unauthenticated, userLogin: {}, message: '');
    }
  }

  Future<bool> isTokenValid(String token) async {
    // final response = await dioClient.post(ApiUrl.checkToken);
    // if (response.statusCode == 200) {
    //   return true;
    // }
    // return false;
    return true;
  }

  Future<bool> refreshAccessToken(String refreshToken) async {
    // final response = await http.post(
    //   Uri.parse('https://yourapi.com/refresh-token'),
    //   body: jsonEncode({'refresh_token': refreshToken}),
    //   headers: {'Content-Type': 'application/json'},
    // );
    //
    // if (response.statusCode == 200) {
    //   final data = jsonDecode(response.body);
    //   final newAccessToken = data['access_token'];
    //   final newRefreshToken = data['refresh_token'];
    //
    //   final prefs = await SharedPreferences.getInstance();
    //   await prefs.setString('access_token', newAccessToken);
    //   await prefs.setString('refresh_token', newRefreshToken);
    //   return true;
    // }
    // return false;
    return true;
  }

  clearToken() {}
}
