import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/providers/auth_provider.dart';
import '../features/auth/screens/splash_screen.dart';
import '../features/guided_build/screens/build_start_screen.dart';
import '../features/guided_build/screens/stage_screen.dart';
import '../features/guided_build/screens/build_complete_screen.dart';
import '../features/build_log/screens/build_log_screen.dart';
import '../features/build_log/screens/build_detail_screen.dart';
import '../features/reflections/screens/reflections_screen.dart';
import '../features/settings/screens/settings_screen.dart';
import 'route_names.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      final isOnSplash = state.matchedLocation == '/';

      if (!isLoggedIn && !isOnSplash) return '/';
      if (isLoggedIn && isOnSplash) return '/home';
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.home,
        builder: (context, state) => const BuildStartScreen(),
        routes: [
          GoRoute(
            path: 'build/:buildId',
            name: RouteNames.stage,
            builder: (context, state) => StageScreen(
              buildId: state.pathParameters['buildId']!,
            ),
          ),
          GoRoute(
            path: 'build/:buildId/complete',
            name: RouteNames.buildComplete,
            builder: (context, state) => BuildCompleteScreen(
              buildId: state.pathParameters['buildId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/log',
        name: RouteNames.buildLog,
        builder: (context, state) => const BuildLogScreen(),
        routes: [
          GoRoute(
            path: ':buildId',
            name: RouteNames.buildDetail,
            builder: (context, state) => BuildDetailScreen(
              buildId: state.pathParameters['buildId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/reflections',
        name: RouteNames.reflections,
        builder: (context, state) => const ReflectionsScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: RouteNames.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
});
