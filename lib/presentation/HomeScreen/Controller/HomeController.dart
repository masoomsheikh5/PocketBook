import 'package:expensetracker/Reposetory/TransactionRepository.dart';
import 'package:expensetracker/hivefunctions.dart';
import 'package:expensetracker/presentation/Expense/Controller/ExpenseController.dart';
import 'package:expensetracker/presentation/HomeScreen/Model/TransuctionCategoryModel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {


 var months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ].obs;

  var selectedMonth = ''.obs;
  RxInt trasctionindex=0.obs;
  @override
  void onInit() {
    super.onInit();
    selectedMonth.value = DateFormat('MMMM').format(DateTime.now());
//  ExpenseControllerin.fetchAllExpenses();
getexpensess();
  }

  void updateSelectedMonth(String newMonth) {
    selectedMonth.value = newMonth;
  }
 final dbHelper = DatabaseHelper();

 getexpensess()async{
 Transactions.value= await dbHelper.getTransactions();
 TotalIncome .value= await dbHelper.getTotalIncome();
 TotalExpenses .value= await dbHelper.getTotalExpenses();
 await dbHelper.printIncomingTransactions();
 await dbHelper.printExpenseTransactions();
 await dbHelper.printTodayTransactions();

Totalbalace.value= TotalIncome .value- TotalExpenses .value;
Transactions;
update();

print("Transactions resiult $Transactions");
 }
// //  GetAllTransactions()async{
// // await dbHelper.getAllExpenses();

// expensess;
// update();

// print("expensesss resiult $expensess");
//  }

 

}
