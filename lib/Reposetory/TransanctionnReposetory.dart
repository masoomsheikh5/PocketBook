import 'package:expensetracker/presentation/TransactionScreen/Model/TransactionModel.dart';


class TransactionnRepository {
  List<Transaction> getTransactions() {
    return [
      Transaction(
        category: "Shopping",
        description: "Buy some grocery",
        amount: 120,
        time: DateTime.now().subtract(Duration(hours: 1)),
        type: "expense",
      ),
      Transaction(
        category: "Subscription",
        description: "Disney+ Annual",
        amount: 80,
        time: DateTime.now().subtract(Duration(hours: 4)),
        type: "expense",
      ),
      Transaction(
        category: "Food",
        description: "Buy a ramen",
        amount: 32,
        time: DateTime.now().subtract(Duration(hours: 7)),
        type: "expense",
      ),
      Transaction(
        category: "Salary",
        description: "Salary for July",
        amount: 5000,
        time: DateTime.now().subtract(Duration(days: 1)),
        type: "income",
      ),
      Transaction(
        category: "Transportation",
        description: "Charging Tesla",
        amount: 18,
        time: DateTime.now().subtract(Duration(days: 1, hours: 8)),
        type: "expense",
      ),
    ];
  }
}
