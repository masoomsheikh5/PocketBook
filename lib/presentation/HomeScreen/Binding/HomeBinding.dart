

import 'package:expensetracker/presentation/Expense/Controller/ExpenseController.dart';
import 'package:expensetracker/presentation/HomeScreen/Controller/HomeController.dart';
import 'package:expensetracker/presentation/OnbordingScreen/Controller/OnbordingContoller.dart';

import 'package:get/get.dart';



class HomeBinding extends Bindings {
 @override
  void dependencies() {
   Get.lazyPut(() => HomeController());



   
 }
}