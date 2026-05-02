import 'package:isar/isar.dart';

import '../../../core/database/isar_db.dart';
import '../domain/menu.dart';

class MenuRepository {
  final Isar _isar = IsarDb.instance;

  Future<List<Menu>> getMenusForDateRange(DateTime start, DateTime end) async {
    return await _isar.menus
        .filter()
        .dateBetween(start, end)
        .sortByDate()
        .findAll();
  }

  Future<void> saveMenu(Menu menu) async {
    await _isar.writeTxn(() async {
      await _isar.menus.put(menu);
    });
  }

  Future<void> deleteMenu(int id) async {
    await _isar.writeTxn(() async {
      await _isar.menus.delete(id);
    });
  }
}
