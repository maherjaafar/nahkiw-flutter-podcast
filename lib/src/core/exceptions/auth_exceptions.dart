import 'package:first_episode/src/src.dart';

class LoginException extends FirstEpisodeException {
  const LoginException(String message) : super(message);
}

class SignUpException extends FirstEpisodeException {
  const SignUpException(String message) : super(message);
}

class SignOutException extends FirstEpisodeException {
  const SignOutException(String message) : super(message);
}
