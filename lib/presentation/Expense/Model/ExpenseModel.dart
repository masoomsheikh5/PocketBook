import 'package:hive/hive.dart';



@HiveType(typeId: 0)
class Expense {
  @HiveField(0)
  late String category;

  @HiveField(1)
  late double amount;

  @HiveField(2)
  late String description;

  @HiveField(3)
  late String imagePath;

  Expense({
    required this.category,
    required this.amount,
    required this.description,
    required this.imagePath,
  });
}
