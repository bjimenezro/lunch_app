import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/finance_provider.dart';

class FinanceScreen extends ConsumerWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debtorsAsync = ref.watch(financeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuentas por Cobrar'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: debtorsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (debtors) {
          if (debtors.isEmpty) {
            return const Center(child: Text('¡Excelente! No hay deudas pendientes.', style: TextStyle(fontSize: 18)));
          }

          final totalDebt = debtors.fold(0.0, (sum, item) => sum + item.currentDebt);

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blueGrey.shade50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total por cobrar:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('\$${totalDebt.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: debtors.length,
                  itemBuilder: (context, index) {
                    final client = debtors[index];
                    return ListTile(
                      title: Text(client.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(client.parentName ?? 'Sin nombre de padre'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${client.currentDebt.toStringAsFixed(2)}', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                            onPressed: () {
                              _showPaymentDialog(context, ref, client.id, client.currentDebt);
                            },
                            child: const Text('Pagar'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showPaymentDialog(BuildContext context, WidgetRef ref, int clientId, double currentDebt) {
    double amount = currentDebt; 

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Registrar Pago'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Deuda actual: \$${currentDebt.toStringAsFixed(2)}'),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: amount.toString(),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Monto a pagar (Ej. transferencia)'),
                onChanged: (val) {
                  amount = double.tryParse(val) ?? 0.0;
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
                if (amount > 0) {
                  ref.read(financeNotifierProvider.notifier).registerPayment(clientId, amount);
                  Navigator.pop(context);
                }
              },
              child: const Text('Confirmar Pago'),
            ),
          ],
        );
      },
    );
  }
}
