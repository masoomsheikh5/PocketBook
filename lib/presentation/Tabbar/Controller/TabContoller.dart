import 'package:expensetracker/presentation/Budgetscreen/View/BudgetView.dart';
import 'package:expensetracker/presentation/HomeScreen/view/HomeView.dart';
import 'package:expensetracker/presentation/TransactionScreen/View/TansactionnView.dart';
import 'package:expensetracker/presentation/UserProfileScreen/view/UserProfieView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabbarController extends GetxController {
  var bottomIndex = 0.obs;
RxBool isCreateEntry=false.obs;
  Widget getPage(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return TransactionnView();
      case 3:
        return BudgetView();
      case 4:
        return UserProfileView();
     
      default:
        return Container(); // Handle unexpected index
    }
  }
}