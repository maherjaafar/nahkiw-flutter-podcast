import 'package:first_episode/src/src.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    _loginRoute,
  ],
);

final _loginRoute = GoRoute(
  name: FirstEpisodeRouteNames.signIn,
  path: FirstEpisodeRouteNames.signIn.path,
  builder: (context, state) => const SignInPage(),
  routes: [
    GoRoute(
      path: FirstEpisodeRouteNames.signUp,
      name: FirstEpisodeRouteNames.signUp,
      builder: (context, state) => const SignUpPage(),
    ),
  ],
);
