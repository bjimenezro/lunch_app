import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/delivery_repository.dart';
import '../../domain/delivery.dart';
import '../../../clients/presentation/providers/client_provider.dart';

part 'delivery_provider.g.dart';

@riverpod
DeliveryRepository deliveryRepository(DeliveryRepositoryRef ref) {
  return DeliveryRepository();
}

@riverpod
class DailyDeliveriesNotifier extends _$DailyDeliveriesNotifier {
  @override
  Future<List<Delivery>> build(DateTime date) async {
    return _fetchDeliveries(date);
  }

  Future<List<Delivery>> _fetchDeliveries(DateTime d) async {
    final repository = ref.read(deliveryRepositoryProvider);
    return repository.getDeliveriesForDate(d);
  }

  Future<void> addDelivery(Delivery delivery) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(deliveryRepositoryProvider);
      await repository.addDeliveryAndUpdateDebt(delivery);
      
      // Invalidar clientes para que la deuda se actualice en la otra pantalla
      ref.invalidate(clientsNotifierProvider);
      
      return _fetchDeliveries(delivery.date);
    });
  }
}
