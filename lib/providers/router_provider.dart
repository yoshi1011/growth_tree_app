import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:growth_tree_app/providers/user_provider.dart';
import 'package:growth_tree_app/screens/curriculums_screen.dart';
import 'package:growth_tree_app/screens/forgot_password_screen.dart';
import 'package:growth_tree_app/screens/login_screen.dart';
import 'package:growth_tree_app/screens/sent_password_reset_mail_screen.dart';
import 'package:growth_tree_app/screens/sent_register_mail_screen.dart';
import 'package:growth_tree_app/screens/sign_up_screen.dart';
import 'package:growth_tree_app/screens/workspace_screen.dart';
import 'package:growth_tree_app/screens/unknown_screen.dart';
import 'package:growth_tree_app/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';
import '../screens/missions_screen.dart';

const loggedInPaths = ['/', '/curriculums'];
const loggedOutPaths = [
  '/login',
  '/forgot_password',
  '/sent_password_reset_mail',
  '/sign_up',
  '/sent_register_mail'
];

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    redirect: (state) {
      final isLoggedIn = ref
          .read(userProvider)
          .isLoggedIn;
      final goToLoggedInPages = loggedInPaths.contains(state.subloc);
      final goToLoggedOutPages = loggedOutPaths.contains(state.subloc);

      if (!isLoggedIn && goToLoggedInPages) {
        return '/login';
      }
      if (isLoggedIn && goToLoggedOutPages) {
        return '/curriculums';
      }

      return null;
    },
    refreshListenable: RouterNotifier(ref),
    routes: [
      GoRoute(path: '/', builder: (context, state) => const WorkspaceScreen()),
      GoRoute(path: '/curriculums',
          builder: (context, state) => const CurriculumsScreen()),
      GoRoute(path: '/missions',
          builder: (context, state) => const MissionsScreen()),
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
    errorPageBuilder: (context, state) =>
    const MaterialPage(
      child: UnknownScreen(),
    ),
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<User?>(userProvider, (_, __) => notifyListeners());
  }
}
