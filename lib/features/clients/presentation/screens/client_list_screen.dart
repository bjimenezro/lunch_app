import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/client_provider.dart';

class ClientListScreen extends ConsumerWidget {
  const ClientListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientsAsync = ref.watch(clientsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Niños (Clientes)'),
      ),
      body: clientsAsync.when(
        data: (clients) {
          if (clients.isEmpty) {
            return const Center(child: Text('No hay niños registrados aún.'));
          }
          return ListView.builder(
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];
              return ListTile(
                title: Text(client.name),
                subtitle: Text(client.school ?? 'Sin escuela'),
                trailing: Text('\$${client.currentDebt.toStringAsFixed(2)}', style: TextStyle(
                  color: client.currentDebt > 0 ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                )),
                onTap: () {
                  context.push('/edit-client', extra: client);
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-client'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
