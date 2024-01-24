import 'package:first_episode/src/src.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_repository.g.dart';

class AuthenticationRepository {
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return futureCall(
      apiCall: () async {
        await Future.delayed(const Duration(seconds: 5));
        return 'token';
      },
      exception: (errorMessage) => LoginException(errorMessage),
    );
  }

  Future<String> registerWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    return futureCall(
      apiCall: () async {
        await Future.delayed(const Duration(seconds: 1));
        return 'token';
      },
      exception: (errorMessage) => SignUpException(errorMessage),
    );
  }

  Future<void> logout() async {
    return futureCall(
      apiCall: () async {
        await Future.delayed(const Duration(seconds: 1));
        return;
      },
      exception: (errorMessage) => SignUpException(errorMessage),
    );
  }
}

@riverpod
AuthenticationRepository authenticationRepository(
  AuthenticationRepositoryRef ref,
) =>
    AuthenticationRepository();
