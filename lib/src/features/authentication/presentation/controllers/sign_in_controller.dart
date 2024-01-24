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

// @riverpod
// Future<String> signInWithEmailAndPassword(
//   SignInWithEmailAndPasswordRef ref, {
//   required TextEditingController emailController,
//   required TextEditingController passwordController,
// }) async {
//   final email = emailController.text;
//   final password = passwordController.text;
//   logger.d('signInWithEmailAndPassword: $email, $password');
//   assert(email.isNotEmpty, 'Email must not be empty');
//   assert(password.isNotEmpty, 'Password must not be empty');
//   try {
//     const AsyncLoading();
//     final authService = ref.watch(authenticationServiceProvider);
//     final data = await authService.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     AsyncData(data);
//     return data;
//   } on Exception {
//     AsyncError('Error signing in', StackTrace.current);
//     rethrow;
//   }
// }
