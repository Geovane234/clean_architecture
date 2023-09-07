import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import 'error_screen.dart';

// GoRouter allows you to customize the transition animation for each GoRoute. To configure a custom transition animation, provide a pageBuilder parameter to the GoRoute constructor:
// When a deep link is received from the platform, GoRouter will display the configured screen based on the URL path. To configure your Android or iOS app for deep linking, see the Deep linking

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/dashboard',
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen();
      },
    ),
  ],
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => GoRouterErrorScreen(state.error),
);
  // GoRouter get routers => router;
