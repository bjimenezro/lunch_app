import 'package:isar/isar.dart';

import '../../../core/database/isar_db.dart';
import '../../clients/domain/client.dart';
import '../domain/payment.dart';

class PaymentRepository {
  final Isar _isar = IsarDb.instance;

  Future<void> addPaymentAndUpdateDebt(Payment payment) async {
    await _isar.writeTxn(() async {
      await _isar.payments.put(payment);
      
      final client = await _isar.clients.get(payment.clientId);
      if (client != null) {
        client.currentDebt -= payment.amount;
        if (client.currentDebt < 0) {
          client.currentDebt = 0; // Evitar saldos negativos
        }
        await _isar.clients.put(client);
      }
    });
  }
}
