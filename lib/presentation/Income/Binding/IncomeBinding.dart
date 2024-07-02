import 'package:expensetracker/presentation/Expense/Controller/ExpenseController.dart';
import 'package:expensetracker/presentation/Income/Controller/IncomeController.dart';
import 'package:expensetracker/presentation/OnbordingScreen/Controller/OnbordingContoller.dart';

import 'package:get/get.dart';



class IncomeBinding extends Bindings {
 @override
  void dependencies() {
   Get.lazyPut(() => IncomeController());
 }
}