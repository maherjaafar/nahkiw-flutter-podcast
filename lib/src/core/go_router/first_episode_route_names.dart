class FirstEpisodeRouteNames {
  static const String root = '/';
  static const String signIn = 'sign-in';
  static const String signUp = 'sign-up';
  static const String confirmEmail = 'confirm-email';
}

extension FirstEpisodeRouteNamesX on String {
  String get path => startsWith('/') ? this : '/$this';
}
