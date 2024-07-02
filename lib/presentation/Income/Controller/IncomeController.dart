import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

const String userHiveBox = 'users';

class IncomeController extends GetxController{
   // List of expense categories
   final amoutcontroller=TextEditingController();
   final discriptioncontroller=TextEditingController();
   RxString categoryname="".obs;
   RxString discription="".obs;
final List<String> incomeCategories = [
  'Salary',
  'Investments',
  'Business Income',
  'Other Income',
];

  // Selected image file
  var selectedImage = Rxn<File>();

  void setSelectedImage(File image) {
    selectedImage.value = image;
  }
// lib/widgets/hivefunctions.dart

Rxn<DateTime> selectedDate = Rxn<DateTime>();
  Rxn<TimeOfDay> selectedTime = Rxn<TimeOfDay>();

  Future<void> selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        selectedDate.value = pickedDate;
        selectedTime.value = pickedTime;
      }
    }
  }

  String formatDateTime() {
    if (selectedDate.value == null || selectedTime.value == null) {
      return 'Add Date and Time';
    } else {
      final dt = DateTime(
        selectedDate.value!.year,
        selectedDate.value!.month,
        selectedDate.value!.day,
        selectedTime.value!.hour,
        selectedTime.value!.minute,
      );
      return DateFormat('yyyy-MM-dd HH:mm').format(dt);
    }
  }

}