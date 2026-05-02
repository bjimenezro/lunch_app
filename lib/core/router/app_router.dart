import 'package:go_router/go_router.dart';

import '../../features/clients/domain/client.dart';
import '../../features/clients/presentation/screens/add_edit_client_screen.dart';
import '../../features/clients/presentation/screens/client_list_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ClientListScreen(),
    ),
    GoRoute(
      path: '/add-client',
      builder: (context, state) => const AddEditClientScreen(),
    ),
    GoRoute(
      path: '/edit-client',
      builder: (context, state) {
        final client = state.extra as Client;
        return AddEditClientScreen(client: client);
      },
    ),
  ],
);
