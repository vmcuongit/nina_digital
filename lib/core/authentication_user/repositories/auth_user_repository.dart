import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants/api_url.dart';
import '../../services/dio_client.dart';
import '../auth_user_storage/auth_user_storage.dart';
import '../../../local_storage/schema/user_token.dart';

final authUserRepositoryProvider = Provider<AuthUserRepository>((ref) {
  return AuthUserRepository(ref.watch(dioProvider));
});

class AuthUserRepository {
  final AuthUserStorage _authUserStorage = AuthUserStorage();
  final DioClient _dioClient;

  String? _accessToken;
  String? _refreshToken;

  AuthUserRepository(this._dioClient);

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Future<void> initData() async {
    _accessToken = await _authUserStorage.getAccessToken();
    _refreshToken = await _authUserStorage.getRefreshToken();
  }

  Future<void> _saveToken({String? accessToken, String? refreshToken}) async {
    final UserToken userToken = UserToken();
    userToken
      ..refreshToken = accessToken ?? ''
      ..refreshToken = refreshToken ?? '';
    await _authUserStorage.saveToken(userToken: userToken);
    await initData();
  }

  Future<void> clearToken() async {
    await _authUserStorage.saveToken(userToken: UserToken());
  }

  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> data}) async {
    Map<String, dynamic> result = {};

    String accessToken = '';
    String refreshToken = '';

    final response = await _dioClient.post(ApiUrl.signIn, data: data);
    if (response.statusCode == 200) {
      if (response.data['status'] == 'success') {
        final data = response.data['data'];
        accessToken = data['accessToken'];
        refreshToken = data['refreshToken'];
      }
      result = {
        'status': response.data['status'],
        'data': response.data['data'],
        'message': response.data['message'],
      };
    } else {
      result = {
        'status': 'error',
        'data': {},
        'message': response.data['message'] ?? 'Không thể truy cập',
      };
    }

    await _saveToken(accessToken: accessToken, refreshToken: refreshToken);
    return result;
  }

  Future<bool> isTokenValid(String? token) async {
    if (token == null || token == '') return false;
    final response =
        await _dioClient.post(ApiUrl.checkToken, data: {'token': token});
    if (response.statusCode == 200) {
      if (response.data['status'] == 'success') return true;
    }
    return false;
  }

  Future<dynamic> refreshAccessToken(String? refreshToken,
      {bool typeString = false}) async {
    if (refreshToken == null || refreshToken == '') return false;
    final response = await _dioClient
        .post(ApiUrl.refreshToken, data: {'token', refreshToken});
    if (response.statusCode == 200) {
      final data = response.data['data'];
      final newAccessToken = data['accessToken'];
      final newRefreshToken = data['refreshToken'];
      await _saveToken(
          accessToken: newAccessToken, refreshToken: newRefreshToken);
      if (typeString) {
        return newAccessToken;
      }
      return true;
    }
    return false;
  }
}
