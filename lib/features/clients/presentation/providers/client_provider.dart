import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/client_repository.dart';
import '../../domain/client.dart';

part 'client_provider.g.dart';

@riverpod
ClientRepository clientRepository(ClientRepositoryRef ref) {
  return ClientRepository();
}

@riverpod
class ClientsNotifier extends _$ClientsNotifier {
  @override
  Future<List<Client>> build() async {
    return _fetchClients();
  }

  Future<List<Client>> _fetchClients() async {
    final repository = ref.read(clientRepositoryProvider);
    return repository.getClients();
  }

  Future<void> addClient(Client client) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(clientRepositoryProvider);
      await repository.saveClient(client);
      return _fetchClients();
    });
  }

  Future<void> updateClient(Client client) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(clientRepositoryProvider);
      await repository.saveClient(client);
      return _fetchClients();
    });
  }

  Future<void> deleteClient(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(clientRepositoryProvider);
      await repository.deleteClient(id);
      return _fetchClients();
    });
  }
}
