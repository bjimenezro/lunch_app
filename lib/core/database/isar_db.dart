import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/clients/domain/client.dart';

class IsarDb {
  static late Isar instance;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    instance = await Isar.open(
      [ClientSchema],
      directory: dir.path,
    );
  }
}
