import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/menu_provider.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuAsync = ref.watch(menuNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Semanal'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: menuAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (menus) {
          final today = DateTime.now();
          final days = List.generate(7, (i) => today.add(Duration(days: i)));

          return ListView.builder(
            itemCount: days.length,
            itemBuilder: (context, index) {
              final date = DateTime(days[index].year, days[index].month, days[index].day);
              
              final isToday = index == 0;
              final dayString = isToday ? "Hoy (${date.day}/${date.month})" : "${date.day}/${date.month}/${date.year}";
              
              final menuForDay = menus.where((m) => m.date.year == date.year && m.date.month == date.month && m.date.day == date.day).firstOrNull;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: isToday ? 4 : 1,
                color: isToday ? Colors.orange.shade50 : null,
                child: ListTile(
                  title: Text(dayString, style: TextStyle(fontWeight: FontWeight.bold, color: isToday ? Colors.orange.shade800 : Colors.blueGrey)),
                  subtitle: Text(menuForDay?.dish ?? 'Toca el lápiz para planificar', style: TextStyle(
                    fontSize: 16,
                    color: menuForDay != null ? Colors.black : Colors.grey,
                    fontStyle: menuForDay != null ? FontStyle.normal : FontStyle.italic,
                  )),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.orange),
                    onPressed: () {
                      _showMenuDialog(context, ref, date, menuForDay?.dish ?? '');
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showMenuDialog(BuildContext context, WidgetRef ref, DateTime date, String currentDish) {
    String dish = currentDish;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Menú del ${date.day}/${date.month}'),
          content: TextFormField(
            initialValue: dish,
            decoration: const InputDecoration(labelText: 'Plato a cocinar'),
            onChanged: (val) {
              dish = val;
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (dish.isNotEmpty) {
                  ref.read(menuNotifierProvider.notifier).saveMenu(date, dish);
                  Navigator.pop(context);
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}
