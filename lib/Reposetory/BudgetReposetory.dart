import 'package:expensetracker/presentation/Budgetscreen/Model/BudgetModel.dart';


class BudgetRepository {
  List<Budget> getBudgets() {
    return [
      Budget(
        category: "Shopping",
        total: 1000,
        spent: 1200,
      ),
      Budget(
        category: "Transportation",
        total: 700,
        spent: 350,
      ),
    ];
  }
}
