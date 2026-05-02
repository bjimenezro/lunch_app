import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/clients/domain/client.dart';
import '../../features/clients/presentation/screens/add_edit_client_screen.dart';
import '../../features/clients/presentation/screens/client_list_screen.dart';
import '../../features/daily_tracking/presentation/screens/daily_tracking_screen.dart';
import '../../features/finances/presentation/screens/finance_screen.dart';
import '../../features/menu/presentation/screens/menu_screen.dart';
import '../widgets/main_scaffold.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const DailyTrackingScreen(),
        ),
        GoRoute(
          path: '/clients',
          builder: (context, state) => const ClientListScreen(),
        ),
        GoRoute(
          path: '/finances',
          builder: (context, state) => const FinanceScreen(),
        ),
        GoRoute(
          path: '/menu',
          builder: (context, state) => const MenuScreen(),
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/add-client',
      builder: (context, state) => const AddEditClientScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/edit-client',
      builder: (context, state) {
        final client = state.extra as Client;
        return AddEditClientScreen(client: client);
      },
    ),
  ],
);
