import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/menu_repository.dart';
import '../../domain/menu.dart';

part 'menu_provider.g.dart';

@riverpod
MenuRepository menuRepository(MenuRepositoryRef ref) {
  return MenuRepository();
}

@riverpod
class MenuNotifier extends _$MenuNotifier {
  @override
  Future<List<Menu>> build() async {
    return _fetchWeekMenu();
  }

  Future<List<Menu>> _fetchWeekMenu() async {
    final now = DateTime.now();
    final start = now.subtract(const Duration(days: 2));
    final end = now.add(const Duration(days: 14));
    
    final repository = ref.read(menuRepositoryProvider);
    return repository.getMenusForDateRange(start, end);
  }

  Future<void> saveMenu(DateTime date, String dish) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(menuRepositoryProvider);
      
      final cleanDate = DateTime(date.year, date.month, date.day);
      
      final menu = Menu()
        ..date = cleanDate
        ..dish = dish;
        
      await repository.saveMenu(menu);
      return _fetchWeekMenu();
    });
  }

  Future<void> deleteMenu(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(menuRepositoryProvider);
      await repository.deleteMenu(id);
      return _fetchWeekMenu();
    });
  }
}
