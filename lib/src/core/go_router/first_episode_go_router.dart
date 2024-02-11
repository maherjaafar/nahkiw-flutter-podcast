import 'package:first_episode/src/src.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'first_episode_go_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
  final isAuth = ValueNotifier<bool>(true);
  ref
    ..onDispose(isAuth.dispose) // don't forget to clean after yourselves (:
    // update the listenable, when some provider value changes
    // here, we are just interested in wheter the user's logged in
    ..listen(
      authenticationStatusProvider.select((value) => value.isUnauthenticated),
      (_, next) {
        isAuth.value = next;
      },
    );
  return GoRouter(
    navigatorKey: routerKey,
    initialLocation: _signInRoute.path,
    refreshListenable: isAuth,
    redirect: (context, state) {
      logger.d('isAuth: ${isAuth.value}');
      if (isAuth.value) {
        return _signInRoute.path;
      } else {
        return _rootRoute.path;
      }
    },
    routes: [
      _rootRoute,
      _signInRoute,
    ],
  );
}

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
