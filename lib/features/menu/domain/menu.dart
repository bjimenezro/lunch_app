import 'package:isar/isar.dart';

part 'menu.g.dart';

@collection
class Menu {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late DateTime date;
  
  late String dish;
}
