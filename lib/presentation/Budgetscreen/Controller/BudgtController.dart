import 'package:expensetracker/Reposetory/BudgetReposetory.dart';
import 'package:expensetracker/presentation/Budgetscreen/Model/BudgetModel.dart';
import 'package:get/get.dart';


class BudgetController extends GetxController {
  final BudgetRepository repository;

  var budgets = <Budget>[].obs;
  var selectedMonth = 'May'.obs; // Default selected month

  BudgetController(this.repository);

  @override
  void onInit() {
    super.onInit();
    fetchBudgets();
  }

  void fetchBudgets() {
    var result = repository.getBudgets();
    budgets.assignAll(result);
  }

  void selectMonth(String month) {
    selectedMonth.value = month;
  }
}
