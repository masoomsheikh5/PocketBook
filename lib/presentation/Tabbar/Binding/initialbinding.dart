import 'package:expensetracker/Reposetory/BudgetReposetory.dart';
import 'package:expensetracker/Reposetory/TransanctionnReposetory.dart';
import 'package:expensetracker/Reposetory/UserProfileReposetory.dart';
import 'package:expensetracker/presentation/Budgetscreen/Controller/BudgtController.dart';
import 'package:expensetracker/presentation/Expense/Controller/ExpenseController.dart';
import 'package:expensetracker/presentation/HomeScreen/Controller/HomeController.dart';
import 'package:expensetracker/presentation/TransactionScreen/Controller/TransuctionController.dart';
import 'package:expensetracker/presentation/UserProfileScreen/Controller/UserController.dart';
import 'package:get/get.dart';


class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
       Get.lazyPut(() => ExpenseController());
    Get.put(TransactionnController(TransactionnRepository()));
    Get.put(UserController(repository: UserRepository()));
    Get.put(BudgetController(BudgetRepository()));
    
    // Get.put(GlobalController());

    // Get.put(ApiClient());
    // Connectivity connectivity = Connectivity();
    // Get.put(NetworkInfo(connectivity));
  }
}
