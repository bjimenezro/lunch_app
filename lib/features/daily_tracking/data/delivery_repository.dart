import 'package:isar/isar.dart';

import '../../../core/database/isar_db.dart';
import '../../clients/domain/client.dart';
import '../domain/delivery.dart';

class DeliveryRepository {
  final Isar _isar = IsarDb.instance;

  Future<List<Delivery>> getDeliveriesForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
    return await _isar.deliverys
        .filter()
        .dateBetween(startOfDay, endOfDay)
        .findAll();
  }

  Future<void> addDeliveryAndUpdateDebt(Delivery delivery) async {
    await _isar.writeTxn(() async {
      // 1. Guardar la entrega
      await _isar.deliverys.put(delivery);
      
      // 2. Actualizar la deuda del cliente
      final client = await _isar.clients.get(delivery.clientId);
      if (client != null) {
        client.currentDebt += delivery.cost;
        await _isar.clients.put(client);
      }
    });
  }
}
