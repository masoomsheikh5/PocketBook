import 'dart:io';

import 'package:expensetracker/presentation/Expense/Model/ExpenseModel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ExpenseController extends GetxController{
   // List of expense categories
   final amoutcontroller=TextEditingController();
   final discriptioncontroller=TextEditingController();
   RxString categoryname="".obs;

  final List<String> expenseCategories = [
    'Groceries',
    'Utilities',
    'Rent or Mortgage',
    'Transportation',
    'Insurance',
    'Dining Out',
    'Entertainment',
    'Clothing',
    'Education',
    'Healthcare',
    'Travel',
    'Gifts and Donations',
    'Savings',
    'Personal Care',
    'Home Maintenance',
    'Subscription Services',
    'Taxes',
    'Miscellaneous',
  ];


  // Selected image file
  var selectedImage = Rxn<File>();

  void setSelectedImage(File image) {
    selectedImage.value = image;
  }
 void submitExpense(String category, double amount, String description, String imagePath) {
    Expense expense = Expense(
      category: category,
      amount: amount,
      description: description,
      imagePath: imagePath,
    );

    var box = Hive.box<Expense>('expenses');
    box.add(expense);
    // Optionally, you can add logic to update UI or notify user
    Get.snackbar('Expense Added', 'Expense added successfully');
  }
}