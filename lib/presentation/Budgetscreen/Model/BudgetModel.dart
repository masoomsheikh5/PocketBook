class Budget {
  final String category;
  final double total;
  final double spent;
  
  Budget({
    required this.category,
    required this.total,
    required this.spent,
  });

  double get remaining => total - spent;
  bool get isExceeded => spent > total;
}
