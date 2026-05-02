import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/clients/domain/client.dart';
import '../../features/daily_tracking/domain/delivery.dart';
import '../../features/finances/domain/payment.dart';
import '../../features/menu/domain/menu.dart';

class IsarDb {
  static late Isar instance;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    instance = await Isar.open(
      [ClientSchema, DeliverySchema, PaymentSchema, MenuSchema],
      directory: dir.path,
    );
  }
}
