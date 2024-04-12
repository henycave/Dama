
import 'package:dama/routes/route_utils.dart';
import 'package:dama/ui/group_player/group_player.dart';
import 'package:dama/ui/login/login.dart';
import 'package:dama/ui/onboarding/onboarding.dart';
import 'package:dama/ui/settings/settings.dart';
import 'package:dama/ui/single_player/single_player.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/app_service.dart';
import '../ui/error/error_page.dart';
import '../ui/widgets/scaffold_with_nav_bar.dart';
import '../ui/loading/loading_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'shell');



class AppRouter{

  AppRouter(this.appService);
  late final AppService appService;

  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
      navigatorKey: _rootNavigatorKey,
      refreshListenable: appService,
      initialLocation: APP_PAGE.groupPlayer.toPath,
      routes: <RouteBase>[
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return ScaffoldWithNavBar(child: child);
          },
          routes: [
            // GoRoute(
            //   path: APP_PAGE.loadingHomePage.toPath,
            //   name: APP_PAGE.loadingHomePage.toName,
            //   builder: (context, state) => const LoadingHomePage(
            //   ),
            // ),
            GoRoute(
              path: APP_PAGE.groupPlayer.toPath,
              name: APP_PAGE.groupPlayer.toName,
              builder: (context, state) => const GroupPlayer(),
            ),
            GoRoute(
                path: APP_PAGE.singlePlayer.toPath,
                name: APP_PAGE.singlePlayer.toName,
                builder: (context, state) => const SinglePlayer(),
            ),
            GoRoute(
                path: APP_PAGE.settings.toPath,
                name: APP_PAGE.settings.toName,
                builder: (context, state) => const Settings(),
            )
          ]
        ),
        GoRoute(
            path: APP_PAGE.loading.toPath,
            name: APP_PAGE.loading.toName,
            builder: (context, state) => const LoadingPage()),
        GoRoute(
            path: APP_PAGE.onboarding.toPath,
            name: APP_PAGE.onboarding.toName,
            builder: (context, state) => const Onboarding()),
        GoRoute(
            path: APP_PAGE.login.toPath,
            name: APP_PAGE.login.toName,
            builder: (context, state) => const Login()),
      ],
    errorBuilder: (context, state) =>
        ErrorPage(error: state.pathParameters['error'] ?? ""),
//   redirect: (context, state) {
//     final groupPlayerLocation = _goRouter.namedLocation(APP_PAGE.groupPlayer.toName);
//     final loadingLocation = _goRouter.namedLocation(APP_PAGE.loading.toName);
//
//
//     final isLoggedIn = appService.loginState;
//     final isInitialized = appService.initialized;
//     final isOnboarded = appService.onBoarding;
//
//     final isGoingToLogin = state.uri.toString() == loginLocation;
//     final isGoingToInit = state.uri.toString() == loadingLocation;
//     final isGoingToOnboard = state.uri.toString() == onboardLocation;
//     final isGoingToHelpPage = state.uri.toString() == helpLocation;
//
// // If not Initialized and not going to Initialized redirect to Loading
//     if (!isInitialized && !isGoingToInit) {
//       return loadingLocation;
// // If not onboard and not going to onboard redirect to OnBoarding
//     } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
//       return onboardLocation;
// // If not loggedIn and not going to login redirect to Login
//     } else if (isInitialized &&
//         isOnboarded &&
//         !isLoggedIn &&
//         !isGoingToLogin) {
//       return loginLocation;
// // If all the scenarios are cleared but still going to any of that screen redirect to Home
//     } else if (isLoggedIn &&
//         isInitialized &&
//         isOnboarded &&
//         isGoingToHelpPage) {
//       return helpLocation;
//     } else if (((isLoggedIn && isGoingToLogin) ||
//         (isInitialized && isGoingToInit) ||
//         (isOnboarded && isGoingToOnboard)) &&
//         !isGoingToHelpPage) {
//       return homeLoadingLocation;
//     } else {
// // Else Don't do anything
//       return null;
//     }
//   }

  );

}