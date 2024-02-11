import 'package:first_episode/src/src.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
AuthenticationStatus authenticationStatus(AuthenticationStatusRef ref) {
  final authState = ref.watch(authenticationProvider).valueOrNull;
  return authState?.status ?? AuthenticationStatus.unauthenticated;
}

@riverpod
class Authentication extends _$Authentication {
  @override
  Future<AuthenticationState> build() async {
    return const AuthenticationState(
      accessToken: null,
      status: AuthenticationStatus.unauthenticated,
    );
  }

  Future<void> signInWithEmailAndPassword({
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
      state = AsyncData(AuthenticationState(
        accessToken: data,
        status: AuthenticationStatus.authenticated,
      ));
    } on Exception {
      rethrow;
    }
  }
}
