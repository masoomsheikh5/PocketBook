// lib/presentation/views/transaction_view.dart

import 'dart:ffi';

import 'package:expensetracker/Theme/AppTheme.dart';
import 'package:expensetracker/Utils/Image_Constant.dart';
import 'package:expensetracker/Widgets/Custom_Text_Widget.dart';
import 'package:expensetracker/Widgets/monthDropdown.dart';
import 'package:expensetracker/hivefunctions.dart';
import 'package:expensetracker/presentation/Expense/Controller/ExpenseController.dart';
import 'package:expensetracker/presentation/Expense/Model/ExpenseModel.dart';
import 'package:expensetracker/presentation/HomeScreen/Controller/HomeController.dart';
import 'package:expensetracker/routes/App_Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Container(
        child: Column(
          children: [
            SizedBox(height: ScreenSizeConfig.screenHeight * .06),
            // Obx(() => Container(
            //     width: 250, // Set width of container
            //     height: 60, // Set height of container
            //     decoration: BoxDecoration(
            //       border:
            //           Border.all(color: Themecolor.themecolor), // Border color
            //       borderRadius:
            //           BorderRadius.circular(8), // Optional: Border radius
            //     ),
            //     padding: EdgeInsets.symmetric(
            //         horizontal: 12), // Optional: Padding inside container
            //     child: DropdownButtonHideUnderline(
            //       child: DropdownButton<String>(
            //         value: controller.selectedMonth.value,
            //         onChanged: (newValue) {
            //           controller.updateSelectedMonth(newValue!);
            //         },
            //         items: controller.months.map((month) {
            //           return DropdownMenuItem<String>(
            //             value: month,
            //             child: Text(month),
            //           );
            //         }).toList(),
            //       ),
            //     ))),
            // DropdownButton<String>(
            //       value: controller.selectedMonth.value,
            //       onChanged: (String? newValue) {
            //         controller.updateSelectedMonth(newValue!);
            //       },
            //       items: controller.months.map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            //     ),

            SizedBox(
              height: ScreenSizeConfig.screenHeight * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextClass(
                    size: 25,
                    fontWeight: FontWeight.bold,
                    title: "Account Balance",
                    fontColor: Colors.black,
                    fontFamily: ""),
              ],
            ),
            SizedBox(
              height: ScreenSizeConfig.screenHeight * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextClass(
                    size: 30,
                    fontWeight: FontWeight.bold,
                    title: "\$ ${Totalbalace.value.toString()} ",
                    fontColor: Themecolor.themecolor,
                    fontFamily: ""),
              ],
            ),
            SizedBox(
              height: ScreenSizeConfig.screenHeight * .07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                  () => Container(
                    height: ScreenSizeConfig.screenHeight * .1,
                    width: ScreenSizeConfig.screenWidth * .4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.green,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextClass(
                            size: 20,
                            fontWeight: FontWeight.bold,
                            title: "Income",
                            fontColor: Colors.white,
                            fontFamily: ""),
                        SizedBox(
                          height: 5,
                        ),
                        TextClass(
                            size: 20,
                            fontWeight: FontWeight.bold,
                            title: "\$ ${TotalIncome.value.toString()}",
                            fontColor: Colors.white,
                            fontFamily: "")
                      ],
                    ),
                  ),
                ),
                Container(
                  height: ScreenSizeConfig.screenHeight * .1,
                  width: ScreenSizeConfig.screenWidth * .4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.red,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      TextClass(
                          size: 20,
                          fontWeight: FontWeight.bold,
                          title: "Expenses",
                          fontColor: Colors.white,
                          fontFamily: ""),
                      SizedBox(
                        height: 5,
                      ),
                      TextClass(
                          size: 20,
                          fontWeight: FontWeight.bold,
                          title: "\$ ${TotalExpenses.value.toString()}",
                          fontColor: Colors.white,
                          fontFamily: "")
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            if (Transactions.isNotEmpty)
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.dbHelper. printTodayTransactions();
                        controller.trasctionindex.value = 0;
                      },
                      child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            border: Border.all(
                              color: Themecolor.themecolor,
                            ),
                            color: controller.trasctionindex.value == 0
                                ? Themecolor.themecolor
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "Today",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: controller.trasctionindex.value == 0
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        controller.dbHelper.printweakTransactions();
                        controller.trasctionindex.value = 1;
                      },
                      child: Container(
                             height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            border: Border.all(color: Themecolor.themecolor),
                            color: controller.trasctionindex.value == 1
                                ? Themecolor.themecolor
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "week",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: controller.trasctionindex.value == 1
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                       controller.dbHelper. printmonthTransactions();
                        controller.trasctionindex.value = 2;
                      },
                      child: Container(
                            height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            border: Border.all(color: Themecolor.themecolor),
                            color: controller.trasctionindex.value == 2
                                ? Themecolor.themecolor
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "Month",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: controller.trasctionindex.value == 2
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),

            if (TodayTransactions.isNotEmpty &&
                controller.trasctionindex.value == 0)
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    itemCount: TodayTransactions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: TodayTransactions[index]
                                    ['transactionscategory'] ==
                                'income'
                            ? Image(
                                image: AssetImage(
                                    ImageConstant.expensetransaction))
                            : Image(
                                image: AssetImage(
                                    ImageConstant.incometransaction)),
                        title: Text("${TodayTransactions[index]['category']}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle:
                            Text("${TodayTransactions[index]['description']}"),
                        trailing: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "\$ ${TodayTransactions[index]['amount'].toString()}",
                              style: TextStyle(
                                  color: Transactions[index]
                                              ['transactionscategory'] ==
                                          'income'
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "${TodayTransactions[index]['date'].toString()} ${Transactions[index]['time'].toString()}",
                              style: TextStyle(
                                  color: Transactions[index]
                                              ['transactionscategory'] ==
                                          'income'
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

            if (ThisWeakTransactions.isNotEmpty &&
                controller.trasctionindex.value == 1)
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    itemCount: ThisWeakTransactions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: ThisWeakTransactions[index]
                                    ['transactionscategory'] ==
                                'income'
                            ? Image(
                                image: AssetImage(
                                    ImageConstant.expensetransaction))
                            : Image(
                                image: AssetImage(
                                    ImageConstant.incometransaction)),
                        title: Text(
                            "${ThisWeakTransactions[index]['category']}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            "${ThisWeakTransactions[index]['description']}"),
                        trailing: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "\$ ${ThisWeakTransactions[index]['amount'].toString()}",
                              style: TextStyle(
                                  color: Transactions[index]
                                              ['transactionscategory'] ==
                                          'income'
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "${ThisWeakTransactions[index]['date'].toString()} ${Transactions[index]['time'].toString()}",
                              style: TextStyle(
                                  color: Transactions[index]
                                              ['transactionscategory'] ==
                                          'income'
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

            if (ThisMonthTransactions.isNotEmpty &&
                controller.trasctionindex.value == 2)
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    itemCount: ThisMonthTransactions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: ThisMonthTransactions[index]
                                    ['transactionscategory'] ==
                                'income'
                            ? Image(
                                image: AssetImage(
                                    ImageConstant.expensetransaction))
                            : Image(
                                image: AssetImage(
                                    ImageConstant.incometransaction)),
                        title: Text("${ThisMonthTransactions[index]['category']}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle:
                            Text("${ThisMonthTransactions[index]['description']}"),
                        trailing: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "\$ ${ThisMonthTransactions[index]['amount'].toString()}",
                              style: TextStyle(
                                  color: ThisMonthTransactions[index]
                                              ['transactionscategory'] ==
                                          'income'
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "${ThisMonthTransactions[index]['date'].toString()} ${ThisMonthTransactions[index]['time'].toString()}",
                              style: TextStyle(
                                  color: Transactions[index]
                                              ['transactionscategory'] ==
                                          'income'
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

            // if (Transactions.isNotEmpty)
            //   Obx(
            //     () => Expanded(
            //       child: ListView.builder(
            //         itemCount: Transactions.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           return ListTile(
            //             leading: Transactions[index]['transactionscategory'] ==
            //                     'income'
            //                 ? Image(
            //                     image:
            //                         AssetImage(ImageConstant.expensetransaction))
            //                 : Image(
            //                     image:
            //                         AssetImage(ImageConstant.incometransaction)),
            //             title: Text("${Transactions[index]['category']}",
            //                 style: TextStyle(fontWeight: FontWeight.bold)),
            //             subtitle: Text("${Transactions[index]['description']}"),
            //             trailing: Column(
            //               children: [
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 Text(
            //                   "\$ ${Transactions[index]['amount'].toString()}",
            //                   style: TextStyle(
            //                       color: Transactions[index]
            //                                   ['transactionscategory'] ==
            //                               'income'
            //                           ? Colors.green
            //                           : Colors.red,
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 20),
            //                 ),
            //                 Text(
            //                   "${Transactions[index]['date'].toString()} ${Transactions[index]['time'].toString()}",
            //                   style: TextStyle(
            //                       color: Transactions[index]
            //                                   ['transactionscategory'] ==
            //                               'income'
            //                           ? Colors.green
            //                           : Colors.red),
            //                 ),
            //               ],
            //             ),
            //           );
            //         },
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    ));
  }
}
