import 'package:expensetracker/Reposetory/BudgetReposetory.dart';
import 'package:expensetracker/presentation/Budgetscreen/Controller/BudgtController.dart';
import 'package:get/get.dart';


class BudgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BudgetController>(() => BudgetController(BudgetRepository()));
  }
}
