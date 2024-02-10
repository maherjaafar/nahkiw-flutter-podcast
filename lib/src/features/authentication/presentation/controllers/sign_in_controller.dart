import 'package:first_episode/src/src.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
class Authentication extends _$Authentication {
  @override
  Future<String> build() async {
    return 'token';
  }

  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    logger.d('signInWithEmailAndPassword: $email, $password');
    assert(email.isNotEmpty, 'Email must not be empty');
    assert(password.isNotEmpty, 'Password must not be empty');
    try {
      state = const AsyncLoading();
      final authService = ref.read(authenticationServiceProvider);
      final data = await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = AsyncData(data);
      return data;
    } on Exception {
      rethrow;
    }
  }
}
