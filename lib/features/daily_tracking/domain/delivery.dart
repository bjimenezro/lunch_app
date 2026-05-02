import 'package:isar/isar.dart';

part 'delivery.g.dart';

@collection
class Delivery {
  Id id = Isar.autoIncrement;

  @Index()
  late int clientId;
  
  @Index()
  late DateTime date;
  
  late double cost;
}
