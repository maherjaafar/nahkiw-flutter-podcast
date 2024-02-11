import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}

extension AuthenticationStatusX on AuthenticationStatus {
  bool get isAuthenticated => this == AuthenticationStatus.authenticated;
  bool get isUnauthenticated => this == AuthenticationStatus.unauthenticated;
}

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    required AuthenticationStatus status,
    String? accessToken,
  }) = _AuthenticationState;
}
