import 'package:first_episode/src/src.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_service.g.dart';

class AuthenticationService {
  AuthenticationService({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    assert(email.isNotEmpty, 'Email must not be empty');
    assert(password.isNotEmpty, 'Password must not be empty');
    try {
      return _authenticationRepository.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      rethrow;
    }
  }

  Future<String> signUpWithEmailAndPassword({
    required User user,
    required String password,
  }) async {
    assert(user.isNotNull, 'User values must not be null');
    assert(password.isNotEmpty, 'Password must not be empty');
    try {
      return _authenticationRepository.registerWithEmailAndPassword(
        firstName: user.firstName!,
        lastName: user.lastName!,
        email: user.email!,
        password: password,
      );
    } on Exception {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      return _authenticationRepository.logout();
    } on Exception {
      rethrow;
    }
  }

  final AuthenticationRepository _authenticationRepository;
}

@riverpod
AuthenticationService authenticationService(
  AuthenticationServiceRef ref,
) =>
    AuthenticationService(
      authenticationRepository: ref.watch(authenticationRepositoryProvider),
    );
