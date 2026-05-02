import 'package:isar/isar.dart';

part 'payment.g.dart';

@collection
class Payment {
  Id id = Isar.autoIncrement;

  @Index()
  late int clientId;
  
  @Index()
  late DateTime date;
  
  late double amount;
}
