import 'dart:io';

import 'package:expensetracker/Theme/AppTheme.dart';
import 'package:expensetracker/Widgets/Custom_Button.dart';
import 'package:expensetracker/Widgets/Custom_Text_Widget.dart';
import 'package:expensetracker/Widgets/monthDropdown.dart';
import 'package:expensetracker/presentation/Expense/Controller/ExpenseController.dart';
import 'package:expensetracker/presentation/Income/Controller/IncomeController.dart';
import 'package:expensetracker/routes/App_Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:expensetracker/hivefunctions.dart';

class IncomeView extends GetWidget<IncomeController> {
//  final dbHelper = DBHelper.instance;
  final ImagePicker _picker = ImagePicker();


//    void _submitExpense(String category, double amount, String description, String imagePath) async {
//     Map<String, dynamic> row = {
//       'source': category,
//       'amount': amount,
//       'description': description,
//       'imagePath': imagePath,
//     };

//     int id = await dbHelper.insertIncome(row);
//     print('Inserted row id: $id');
//   }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: ScreenSizeConfig.screenHeight,
        width: ScreenSizeConfig.screenWidth,
        color: Colors.green,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              TextClass(
                  size: 30,
                  fontWeight: FontWeight.bold,
                  title: "Income",
                  fontColor: Colors.white,
                  fontFamily: ""),
              SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    height: ScreenSizeConfig.screenHeight * 0.1,
                    width: ScreenSizeConfig.screenWidth * 0.5,
                    // color: Colors.white,
                    child: Row(
                      children: [
                        TextClass(
                          size: 50,
                          fontWeight: FontWeight.bold,
                          title: "\$",
                          fontColor: Colors.white,
                          fontFamily: "",
                        ),
                        SizedBox(
                            width:
                                10), // Adjust spacing between $ and TextFormField
                        Expanded(
                          child: TextFormField(
                            controller: controller.amoutcontroller,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 45,color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  width: ScreenSizeConfig.screenWidth,
                  height: ScreenSizeConfig.screenHeight * .7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: ScreenSizeConfig.screenWidth * .8,
                      decoration: BoxDecoration(
                        border: Border.all(color: Themecolor.themecolor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Select Category',
                            hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
                            ),
                            items: controller.incomeCategories
                                .map((String category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Text(
                                  category,
                                  style: TextStyle(
                                      color: Themecolor.themecolor,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              // Handle dropdown value change
                              controller.categoryname.value=value!;
                              print('Selected category: $value');
                            },
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: ScreenSizeConfig.screenWidth *
                          .8, // Assuming you want it to occupy full width
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Themecolor.themecolor), // Container border
                        borderRadius:
                            BorderRadius.circular(8), // Container border radius
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller:controller.discriptioncontroller ,
                          decoration: InputDecoration(
                              border:
                                  InputBorder.none, // Remove text field border
                              hintText: 'Enter Description',
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          maxLines:
                              null, // Allow unlimited lines for description
                          keyboardType:
                              TextInputType.multiline, // Allow multiline input
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                 
DateTimePickerContainer(),
                 SizedBox(
                      height: 20,
                    ),       
                    CustomButton(
                        title: "Submit",
                        color: Themecolor.themecolor,
                        radius: 10,
                        width: ScreenSizeConfig.screenWidth * .8,
                        height: ScreenSizeConfig.screenHeight * .05,
                        onPressed: () {
                          DatabaseHelper().insertTransaction({
                        'category': controller.categoryname.value,
                        'transactionscategory':'income',
                        'description': controller.discriptioncontroller.text ,
                        'amount':  double.parse(controller.amoutcontroller.text),
                        'date': date.value,
                        'time': time.value
                      });

                      Get.offAllNamed(AppRoutes.TabBarScreen);
                        // _submitExpense(controller.categoryname.value, double.parse(controller.amoutcontroller.text), controller.discriptioncontroller.text, "");
                        },
                        fontSize: 20,
                        textColor: Colors.white)
                  ]))
            ],
          ),
        ),
      ),
    ));
  }
}