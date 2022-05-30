// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../models/user.dart';
import '../screens/account/account_screen.dart';
import '../screens/curriculums/curriculum_detail_screen.dart';
import '../screens/curriculums/curriculums_screen.dart';
import '../screens/forgot_password_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/missions/missions_screen.dart';
import '../screens/sent_password_reset_mail_screen.dart';
import '../screens/sent_register_mail_screen.dart';
import '../screens/sign_up/sign_up_screen.dart';
import '../screens/skills/skills_screen.dart';
import '../screens/unknown_screen.dart';
import '../screens/workspace/workspace_screen.dart';
import 'user_state_provider.dart';

const loggedInPaths = [
  '/',
  '/curriculums',
  '/missions',
  '/skills',
  '/accounts',
];
const loggedOutPaths = [
  '/login',
  '/forgot_password',
  '/sent_password_reset_mail',
  '/sign_up',
  '/sent_register_mail',
];

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    redirect: (state) {
      // TODO: ログイン状態をCookieから確認する方法を実装して再度書き直す
      final _userStateProvider = ref.watch(userStateProvider.notifier);
      final isLoggedIn = _userStateProvider.isLoggedIn();
      final goToLoggedInPages = loggedInPaths.contains(state.subloc);
      final goToLoggedOutPages = loggedOutPaths.contains(state.subloc);

      if (!isLoggedIn && goToLoggedInPages) {
        return '/login';
      }
      if (isLoggedIn && goToLoggedOutPages) {
        return '/';
      }

      return null;
    },
    refreshListenable: RouterNotifier(ref),
    routes: [
      GoRoute(path: '/', builder: (context, state) => const WorkspaceScreen()),
      GoRoute(
          path: '/curriculums',
          builder: (context, state) => const CurriculumsScreen()),
      GoRoute(
          path: '/curriculum_detail',
          builder: (context, state) => const CurriculumDetailScreen()),
      GoRoute(
          path: '/missions',
          builder: (context, state) => const MissionsScreen()),
      GoRoute(
          path: '/skills',
          builder: (context, state) => const SkillsScreen()),
      GoRoute(
          path: '/accounts',
          builder: (context, state) => const AccountScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
          path: '/forgot_password',
          builder: (context, state) => const ForgotPasswordScreen()),
      GoRoute(
          path: '/sent_password_reset_mail',
          builder: (context, state) => const SentPasswordResetMailScreen()),
      GoRoute(
          path: '/sign_up', builder: (context, state) => const SignUpScreen()),
      GoRoute(
          path: '/sent_register_mail',
          builder: (context, state) => const SentRegisterMailScreen()),
    ],
    errorPageBuilder: (context, state) => const MaterialPage(
      child: UnknownScreen(),
    ),
    urlPathStrategy: UrlPathStrategy.path
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<User?>(userStateProvider, (_, __) => notifyListeners());
  }
}
