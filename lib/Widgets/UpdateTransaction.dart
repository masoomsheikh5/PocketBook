import 'package:expensetracker/hivefunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateIncomeDialog extends StatelessWidget {
  final String ?initialCategory;
  final String ?initialtansactioncategory;
  final String? initialDescription;
  final String? initialDate;
  final String? initialtime;
  final double? initialAmount;
  final int? id;
  final Function(String category, String description, double amount) onUpdate;

  UpdateIncomeDialog({
    Key? key,
    this.initialCategory,
    this.initialDescription,
    this.initialAmount,
    this.initialDate,
    this.initialtime,
    this.initialtansactioncategory,
    this.id,
     required this.onUpdate,
  }) : super(key: key);

  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // _categoryController.text = initialCategory ?? '';
    _descriptionController.text = initialDescription ?? '';
    _dateController.text = initialDate ?? '';
    _timeController.text = initialtime ?? '';
    _amountController.text = initialAmount != null ? initialAmount.toString() : '';

    return AlertDialog(
      title: Text('Update Transaction'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount'),
            ),
             TextFormField(
              controller: _dateController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(labelText: 'date'),
            ),
             TextFormField(
              controller: _timeController,
              keyboardType:TextInputType.datetime,
              decoration: InputDecoration(labelText: 'time'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            String category = _categoryController.text.trim();
            String description = _descriptionController.text.trim();
            double amount = double.tryParse(_amountController.text.trim()) ?? 0.0;
            onUpdate(category, description, amount);
            DatabaseHelper().updateTransaction({
              "id":id,
               'category': _categoryController.text,
                        'transactionscategory':initialtansactioncategory,
                        'description': _descriptionController.text ,
                        'amount':  double.parse(_amountController.text),
                        'date': _dateController.text,
                        'time': _timeController.text});
            Get.back(); // Close dialog
          },
          child: Text('Update'),
        ),
        TextButton(
          onPressed: () {
            Get.back(); // Close dialog without update
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
