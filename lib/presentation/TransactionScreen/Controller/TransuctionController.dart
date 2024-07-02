import 'package:expensetracker/Reposetory/TransanctionnReposetory.dart';
import 'package:expensetracker/hivefunctions.dart';
import 'package:expensetracker/presentation/HomeScreen/Controller/HomeController.dart';
import 'package:expensetracker/presentation/TransactionScreen/Model/TransactionModel.dart';
import 'package:get/get.dart';


class TransactionnController extends GetxController {
  final HomeControllerin=Get.find<HomeController>();
  final TransactionnRepository repository;
 RxInt currentTab = 0.obs;
  var transactions = <Transaction>[].obs;
  var balance = 0.0.obs;
  var income = 0.0.obs;
  var expenses = 0.0.obs;

  TransactionnController(this.repository);

  @override
  void onInit() {
    super.onInit();
    fetchTransactions();
  }

  void fetchTransactions() {
    var result = repository.getTransactions();
    transactions.assignAll(result);

    income.value = result.where((t) => t.type == "income").fold(0, (sum, item) => sum + item.amount);
    expenses.value = result.where((t) => t.type == "expense").fold(0, (sum, item) => sum + item.amount);
    balance.value = income.value - expenses.value;
  }


  void changeTab(int index)async {
    currentTab.value = index;

    switch (currentTab.value) {
            case 0:
               Transactions.value= await HomeControllerin. dbHelper.getTransactions();
            case 1:

            await HomeControllerin. dbHelper.printIncomingTransactions();
            case 2:
            
            await HomeControllerin. dbHelper.printExpenseTransactions();
           
          }
  }
}
