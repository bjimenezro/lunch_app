import 'package:isar/isar.dart';
import '../../../core/database/isar_db.dart';
import '../domain/client.dart';

class ClientRepository {
  final Isar _isar = IsarDb.instance;

  Future<List<Client>> getClients() async {
    return await _isar.clients.where().findAll();
  }

  Future<void> saveClient(Client client) async {
    await _isar.writeTxn(() async {
      await _isar.clients.put(client);
    });
  }

  Future<void> deleteClient(int id) async {
    await _isar.writeTxn(() async {
      await _isar.clients.delete(id);
    });
  }
}
