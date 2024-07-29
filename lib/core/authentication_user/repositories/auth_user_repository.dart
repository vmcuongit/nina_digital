import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/dio_client.dart';
import '../auth_user_storage/auth_user_storage.dart';
import '../../../local_storage/schema/user_token.dart';

final authUserRepositoryProvider = Provider<AuthUserRepository>((ref) {
  return AuthUserRepository(ref.watch(dioProvider));
});

class AuthUserRepository {
  final AuthUserStorage _authUserStorage = AuthUserStorage();
  final DioClient dioClient;

  AuthUserRepository(this.dioClient);

  getAccessToken() {
    return _authUserStorage.getAccessToken();
  }

  getRefreshToken() {
    return _authUserStorage.getRefreshToken();
  }

  clearToken() {
    _authUserStorage.saveToken(userToken: UserToken());
  }
}
