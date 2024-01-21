import 'package:first_episode/src/src.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: _signInRoute.path,
  routes: [
    _rootRoute,
    _signInRoute,
  ],
);

final _rootRoute = GoRoute(
  path: '/',
  name: FirstEpisodeRouteNames.root,
  builder: (context, state) => const HomePage(),
);

final _signInRoute = GoRoute(
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
