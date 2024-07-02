import 'package:expensetracker/presentation/Budgetscreen/Controller/BudgtController.dart';
import 'package:expensetracker/presentation/Budgetscreen/Model/BudgetModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BudgetView extends GetWidget<BudgetController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Budget"),
        centerTitle: true,
      
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Obx(() => ListView.builder(
                      itemCount: controller.budgets.length,
                      itemBuilder: (context, index) {
                        var budget = controller.budgets[index];
                        return _buildBudgetCard(budget);
                      },
                    )),
              ),
              SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: () {
              //     // Logic to create a new budget
              //   },
              //   child: Text("Create a budget"),
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.purple,
              //     onPrimary: Colors.white,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
   
    );
  }

  Widget _buildBudgetCard(Budget budget) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildCategoryIcon(budget.category),
                SizedBox(width: 10),
                Text(
                  budget.category,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                if (budget.isExceeded)
                  Icon(Icons.error, color: Colors.red),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Remaining \$${budget.remaining.toStringAsFixed(2)}'),
                Text('\$${budget.spent.toStringAsFixed(2)} of \$${budget.total.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: budget.spent / budget.total,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(
                  budget.isExceeded ? Colors.red : Colors.blue,
                ),
                minHeight: 10,
              ),
            ),
            if (budget.isExceeded)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "You've exceed the limit!",
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(String category) {
    switch (category) {
      case "Shopping":
        return Icon(Icons.shopping_cart, color: Colors.orange);
      case "Transportation":
        return Icon(Icons.directions_car, color: Colors.blue);
      default:
        return Icon(Icons.category);
    }
  }
}
