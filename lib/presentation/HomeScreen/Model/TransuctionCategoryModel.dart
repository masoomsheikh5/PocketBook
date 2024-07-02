class Transaction {
  final String category;
  final String description;
  final double amount;
  final DateTime time;

  Transaction({
    required this.category,
    required this.description,
    required this.amount,
    required this.time,
  });
}
