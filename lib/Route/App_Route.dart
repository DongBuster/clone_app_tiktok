import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Page/loginPage/login_screen.dart';
import '../layout/main_layout.dart';
import '../utils/export.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

class AppRoute {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/home',
    // refreshListenable: ,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigator,
          builder: (context, state, child) => MainLayout(child: child),
          routes: [
            GoRoute(
              path: '/login',
              name: 'loginScreen',
              builder: (context, state) =>
                  const MainLayout(child: LoginScreen()),
            ),
            GoRoute(
              path: '/home',
              name: 'homeScreen',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                    child: MainLayout(child: HomePage()));
              },
            ),
            GoRoute(
              path: '/shop',
              name: 'ShopScreen',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                    child: MainLayout(child: ShopPage()));
              },
            ),
            GoRoute(
              path: '/addvideo',
              name: 'addvideoScreen',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                    child: MainLayout(child: AddVideo()));
              },
            ),
            GoRoute(
              path: '/mail',
              name: 'mailScreen',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                    child: MainLayout(child: MailPage()));
              },
            ),
            GoRoute(
              path: '/profile',
              name: 'profileScreen',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: MainLayout(child: ProfilePage()),
                );
              },
            ),
          ])
    ],
    errorBuilder: (context, state) {
      return Container(
        alignment: Alignment.center,
        child: const Text('error route'),
      );
    },
  );
}
