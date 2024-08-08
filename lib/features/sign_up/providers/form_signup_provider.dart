import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/dio_client.dart';
import '../../../shared/utils/form_status.dart';
import '../repositories/signup_repository.dart';

part 'form_signup_state.dart';
part 'form_signup_provider.g.dart';

@riverpod
class FormSignUp extends _$FormSignUp {
  late final SignupRepository _signupRepository;

  @override
  FormSignUpState build() {
    _signupRepository = SignupRepository(ref.watch(dioProvider));
    return FormSignUpState(formStatus: FormStatus.pure);
  }

  onEmailChange(String value) {
    state = state.copyWith(email: value);
  }

  onPhoneChange(String value) {
    state = state.copyWith(phone: value);
  }

  onPasswordChange(String value) {
    state = state.copyWith(password: value);
  }

  onRePasswordChange(String value) {
    state = state.copyWith(rePassword: value);
  }

  Future<void> submit() async {
    state = state.copyWith(formStatus: FormStatus.submissionInProgress);
    final result = await _signupRepository.SignUp(data: state.toJson());
    if (result['status'] == 'success') {
      state =
          state.copyWith(formStatus: FormStatus.submissionSuccess, message: '');
    } else {
      state = state.copyWith(
          formStatus: FormStatus.submissionFailure, message: result['message']);
    }
  }
}
