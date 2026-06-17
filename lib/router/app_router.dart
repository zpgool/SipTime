import 'package:go_router/go_router.dart';

import '../app.dart';
import '../screens/splash_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            const NoTransitionPage(
              child: SplashScreen(),
            ),
      ),
      GoRoute(
        path: '/main',
        pageBuilder: (context, state) =>
            const NoTransitionPage(
              child: MainScreen(),
            ),
      ),
    ],
  );
}