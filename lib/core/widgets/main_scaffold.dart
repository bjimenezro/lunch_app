import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.today), label: 'Hoy'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Niños'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Cuentas'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Menú'),
        ],
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/menu')) {
      return 3;
    }
    if (location.startsWith('/finances')) {
      return 2;
    }
    if (location.startsWith('/clients')) {
      return 1;
    }
    return 0; // Default a Hoy
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/clients');
        break;
      case 2:
        context.go('/finances');
        break;
      case 3:
        context.go('/menu');
        break;
    }
  }
}
