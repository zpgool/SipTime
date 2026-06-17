import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/history_screen.dart';
import '../screens/settings_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: HomeScreen()),
      ),
      GoRoute(
        path: '/history',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: HistoryScreen()),
      ),
      GoRoute(
        path: '/settings',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SettingsScreen()),
      ),
    ],
  );
}
