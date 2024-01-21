class FirstEpisodeRouteNames {
  static const String signIn = '/';
  static const String signUp = 'sign-up';
}

extension FirstEpisodeRouteNamesX on String {
  String get path => startsWith('/') ? this : '/$this';
}
