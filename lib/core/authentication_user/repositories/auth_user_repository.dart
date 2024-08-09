import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants/api_url.dart';
import '../../../shared/utils/helper.dart';
import '../../services/dio_client.dart';
import '../auth_user_storage/auth_user_storage.dart';
import '../../../local_storage/schema/user_token.dart';
import '../model/user_model.dart';

final authUserRepositoryProvider = Provider<AuthUserRepository>((ref) {
  return AuthUserRepository(ref.watch(dioProvider));
});

class AuthUserRepository {
  final AuthUserStorage _authUserStorage = AuthUserStorage();
  final DioClient _dioClient;

  String? _accessToken;
  String? _refreshToken;
  String? _userLogin;

  AuthUserRepository(this._dioClient);

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  String? get userLogin => _userLogin;

  Future<void> initData() async {
    _accessToken = await _authUserStorage.getAccessToken();
    _refreshToken = await _authUserStorage.getRefreshToken();
    _userLogin = await _authUserStorage.getUserLogin();
  }

  void _clearData() {
    _accessToken = '';
    _refreshToken = '';
    _userLogin = '';
  }

  Future<void> _saveToken(
      {String? accessToken, String? refreshToken, String? userLogin}) async {
    final UserToken userToken = UserToken();
    userToken
      ..accessToken = accessToken ?? this.accessToken
      ..refreshToken = refreshToken ?? this.refreshToken
      ..userLogin = userLogin ?? this.userLogin;
    await _authUserStorage.saveToken(userToken: userToken);
    await initData();
  }

  Future<void> clearToken() async {
    _clearData();
    await _authUserStorage.saveToken(userToken: UserToken());
  }

  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> data}) async {
    Map<String, dynamic> result = {};

    String accessToken = '';
    String refreshToken = '';
    String userLogin = '';

    final response = await _dioClient.post(ApiUrl.signIn, data: data);
    if (response.statusCode == 200) {
      if (response.data['status'] == 'success') {
        final data = response.data['data'];
        final userModel = UserModel.fromJson(data['data']);
        accessToken = data['accessToken'];
        refreshToken = data['refreshToken'];
        userLogin = jsonEncode(userModel.toJson());

        result = {
          'status': response.data['status'],
          'data': userModel.toJson(),
          'message': response.data['message'],
        };
      } else {
        result = {
          'status': response.data['status'],
          'data': {},
          'message': response.data['message'],
        };
      }
    } else {
      result = {
        'status': 'error',
        'data': {},
        'message': response.data?['message'] ?? 'Không thể truy cập',
      };
    }

    await _saveToken(
        accessToken: accessToken,
        refreshToken: refreshToken,
        userLogin: userLogin);
    return result;
  }

  Future<bool> isTokenValid(String? token) async {
    if (Helper.isNull(token)) return false;
    final response =
        await _dioClient.post(ApiUrl.checkToken, data: {'token': token});
    if (response.statusCode == 200) {
      if (response.data['status'] == 'success') return true;
    }
    return false;
  }

  Future<dynamic> refreshAccessToken(String? refreshToken,
      {bool typeString = false}) async {
    if (Helper.isNull(refreshToken)) return false;
    final response = await _dioClient
        .post(ApiUrl.refreshToken, data: {'token': refreshToken});
    String newAccessToken = '';

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
    if (typeString) {
      return newAccessToken;
    }
    return false;
  }

  Future<dynamic> saveDeviceToken(String token) async {
    if (!Helper.isNull(userLogin)) {
      final user = jsonDecode(userLogin!);
      await _dioClient.put('${ApiUrl.uploadUser}/${user['id']}',
          data: {'deviceToken': token});
    }
  }
}
