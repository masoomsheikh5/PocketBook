class Transaction {
  final String category;
  final String description;
  final double amount;
  final DateTime time;
  final String type; // "income" or "expense"

  Transaction({
    required this.category,
    required this.description,
    required this.amount,
    required this.time,
    required this.type,
  });
}