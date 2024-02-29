import 'package:go_router/go_router.dart';
import 'package:quick_notes/src/features/auth/presentation/account_screen.dart';
import 'package:quick_notes/src/features/auth/presentation/login_screen.dart';
import 'package:quick_notes/src/features/notes/notes_list_screen.dart';
import 'package:quick_notes/src/splash_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
          path: '/login',
          name: AppRoutes.login.name,
          builder: (context, state) => const LoginScreen()),
      GoRoute(
          path: '/home',
          name: AppRoutes.home.name,
          builder: (context, state) => const NotesListScreen()),
      GoRoute(
          path: '/account',
          name: AppRoutes.account.name,
          builder: (context, state) => const AccountScreen()),
    ],
  );
}

enum AppRoutes {
  splash,
  home,
  login,
  register,
  account,
}
