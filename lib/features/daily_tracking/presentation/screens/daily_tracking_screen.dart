import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../clients/presentation/providers/client_provider.dart';
import '../providers/delivery_provider.dart';
import '../../domain/delivery.dart';

class DailyTrackingScreen extends ConsumerWidget {
  const DailyTrackingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateTime.now();
    final todayStart = DateTime(today.year, today.month, today.day);

    final clientsAsync = ref.watch(clientsNotifierProvider);
    final deliveriesAsync = ref.watch(dailyDeliveriesNotifierProvider(todayStart));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Entregas de Hoy'),
      ),
      body: clientsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (clients) {
          if (clients.isEmpty) {
            return const Center(child: Text('No hay clientes registrados.'));
          }

          return deliveriesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
            data: (deliveries) {
              // Set de IDs de clientes que ya recibieron almuerzo hoy
              final deliveredClientIds = deliveries.map((d) => d.clientId).toSet();

              return ListView.builder(
                itemCount: clients.length,
                itemBuilder: (context, index) {
                  final client = clients[index];
                  final isDelivered = deliveredClientIds.contains(client.id);

                  return ListTile(
                    title: Text(client.name, style: TextStyle(
                      decoration: isDelivered ? TextDecoration.lineThrough : null,
                      color: isDelivered ? Colors.grey : null,
                    )),
                    subtitle: Text(client.school ?? 'Sin escuela'),
                    trailing: isDelivered
                        ? const Icon(Icons.check_circle, color: Colors.green, size: 32)
                        : IconButton(
                            icon: const Icon(Icons.lunch_dining, size: 32),
                            color: Colors.orange,
                            onPressed: () {
                              _confirmDelivery(context, ref, client.id, todayStart);
                            },
                          ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  void _confirmDelivery(BuildContext context, WidgetRef ref, int clientId, DateTime date) {
    double cost = 15.0; // Precio por defecto

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar Entrega'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('¿Entregar almuerzo a este niño?'),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: cost.toString(),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Costo del Almuerzo'),
                onChanged: (val) {
                  cost = double.tryParse(val) ?? 15.0;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final delivery = Delivery()
                  ..clientId = clientId
                  ..date = date
                  ..cost = cost;
                
                ref.read(dailyDeliveriesNotifierProvider(date).notifier).addDelivery(delivery);
                Navigator.pop(context);
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}
