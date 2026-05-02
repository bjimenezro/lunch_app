import 'package:isar/isar.dart';

part 'client.g.dart';

@collection
class Client {
  Id id = Isar.autoIncrement;

  late String name;
  
  String? school;
  
  String? parentName;
  
  String? parentPhone;
  
  double currentDebt = 0.0;
}
