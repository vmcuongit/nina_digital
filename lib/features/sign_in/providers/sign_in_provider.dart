import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/authentication_user/providers/auth_user_provider.dart';
import '../../../shared/utils/form_status.dart';

part 'sign_in_state.dart';
part 'sign_in_provider.g.dart';

@riverpod
class SignIn extends _$SignIn {
  @override
  SignInState build() {
    return SignInState();
  }

  onChangeEmail(String? email) {
    state = state.copyWith(email: email);
  }

  onChangePassword(String? password) {
    state = state.copyWith(password: password);
  }

  signIn() async {
    state = state.copyWith(formStatus: FormStatus.submissionInProgress);
    final result =
        await ref.read(authUserProvider.notifier).signIn(data: state.toJson());
    if (result['status'] == 'success') {
      state =
          state.copyWith(formStatus: FormStatus.submissionSuccess, message: '');
    } else {
      state = state.copyWith(
          formStatus: FormStatus.submissionFailure, message: result['message']);
    }
  }
}
