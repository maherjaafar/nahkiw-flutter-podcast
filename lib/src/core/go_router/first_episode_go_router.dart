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
    ..onDispose(isAuth.dispose)
    ..listen(
      authenticationStatusProvider.select((value) => value.isUnauthenticated),
      (_, next) => isAuth.value = next,
    );

  return GoRouter(
    navigatorKey: routerKey,
    initialLocation: _signInRoute.path,
    refreshListenable: isAuth,
    redirect: (context, state) => redirect(
      context,
      state,
      isUnauthenticated: isAuth.value,
    ),
    routes: [
      _rootRoute,
      _signInRoute,
    ],
  );
}

FutureOr<String?> redirect(
  BuildContext context,
  GoRouterState state, {
  required bool isUnauthenticated,
}) {
  final fullPath = state.fullPath;
  if (fullPath == null) return null;
  final isAlreadyAuthPage = isAlreadyInAuthRoute(fullPath);
  if (isUnauthenticated && !isAlreadyAuthPage) {
    return FirstEpisodeRouteNames.signIn.path;
  }
  if (!isUnauthenticated && isAlreadyAuthPage) {
    return FirstEpisodeRouteNames.root;
  }
  return null;
}

bool isAlreadyInAuthRoute(String path) {
  return path.contains(FirstEpisodeRouteNames.signIn.path);
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
