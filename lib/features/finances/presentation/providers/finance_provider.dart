import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/payment_repository.dart';
import '../../domain/payment.dart';
import '../../../clients/presentation/providers/client_provider.dart';
import '../../../clients/domain/client.dart';

part 'finance_provider.g.dart';

@riverpod
PaymentRepository paymentRepository(PaymentRepositoryRef ref) {
  return PaymentRepository();
}

@riverpod
class FinanceNotifier extends _$FinanceNotifier {
  @override
  Future<List<Client>> build() async {
    return _fetchDebtors();
  }

  Future<List<Client>> _fetchDebtors() async {
    final clients = await ref.watch(clientsNotifierProvider.future);
    return clients.where((c) => c.currentDebt > 0).toList();
  }

  Future<void> registerPayment(int clientId, double amount) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(paymentRepositoryProvider);
      
      final payment = Payment()
        ..clientId = clientId
        ..date = DateTime.now()
        ..amount = amount;
        
      await repository.addPaymentAndUpdateDebt(payment);
      
      ref.invalidate(clientsNotifierProvider);
      
      return _fetchDebtors();
    });
  }
}
