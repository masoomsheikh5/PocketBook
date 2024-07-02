// import 'package:expensetracker/Utils/Image_Constant.dart';
// import 'package:expensetracker/hivefunctions.dart';
// import 'package:expensetracker/presentation/TransactionScreen/Controller/TransuctionController.dart';
// import 'package:expensetracker/presentation/TransactionScreen/Model/TransactionModel.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class TransactionnView extends GetWidget<TransactionnController> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//          appBar: AppBar(
//             title: Text('Transaction History'),
//             centerTitle: true,
//             bottom: TabBar(
//               tabs: [
//                 Tab(text: 'All'),
//                 Tab(text: 'Income'),
//                 Tab(text: 'Expenses'),
            
//               ],
//             ),
//           ),
//         body:TabBarView(
//           children: [
//               if (Transactions.isNotEmpty)
//                        if (Transactions.isNotEmpty)
//               Obx(()=>
//                  Expanded(
//                   child: ListView.builder(
//                     itemCount: Transactions.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ListTile(
//                         leading:Transactions[index]['transactionscategory']=='income'? Image(image: AssetImage(ImageConstant.expensetransaction)): Image(image: AssetImage(ImageConstant.incometransaction)),
//                         title: Text("${Transactions[index]['category']}",style:TextStyle(fontWeight: FontWeight.bold)),
//                         subtitle: Text("${Transactions[index]['description']}"),
//                         trailing:
//                             Column(
//                               children: [
//                                 SizedBox(height: 10,),
//                                 Text("\$ ${Transactions[index]['amount'].toString()}",style:TextStyle(color:Transactions[index]['transactionscategory']=='income'? Colors.green:Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
//                                 Text("${Transactions[index]['date'].toString()} ${Transactions[index]['time'].toString()}",style:TextStyle(color:Transactions[index]['transactionscategory']=='income'? Colors.green:Colors.red),),
      
//                               ],
//                             ),
//                       );
//                     },
//                   ),
//                 ),
//               ),

//                if (incomeTransactions.isNotEmpty)
//                        if (incomeTransactions.isNotEmpty)
//               Obx(()=>
//                  Expanded(
//                   child: ListView.builder(
//                     itemCount: incomeTransactions.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ListTile(
//                         leading:incomeTransactions[index]['transactionscategory']=='income'? Image(image: AssetImage(ImageConstant.expensetransaction)): Image(image: AssetImage(ImageConstant.incometransaction)),
//                         title: Text("${incomeTransactions[index]['category']}",style:TextStyle(fontWeight: FontWeight.bold)),
//                         subtitle: Text("${incomeTransactions[index]['description']}"),
//                         trailing:
//                             Column(
//                               children: [
//                                 SizedBox(height: 10,),
//                                 Text("\$ ${incomeTransactions[index]['amount'].toString()}",style:TextStyle(color:incomeTransactions[index]['transactionscategory']=='income'? Colors.green:Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
//                                 Text("${incomeTransactions[index]['date'].toString()} ${incomeTransactions[index]['time'].toString()}",style:TextStyle(color:incomeTransactions[index]['transactionscategory']=='income'? Colors.green:Colors.red),),
      
//                               ],
//                             ),
//                       );
//                     },
//                   ),
//                 ),
//               ),

//                if (expenseTransactions.isNotEmpty)
//                        if (expenseTransactions.isNotEmpty)
//               Obx(()=>
//                  Expanded(
//                   child: ListView.builder(
//                     itemCount: expenseTransactions.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ListTile(
//                         leading:expenseTransactions[index]['transactionscategory']=='income'? Image(image: AssetImage(ImageConstant.expensetransaction)): Image(image: AssetImage(ImageConstant.incometransaction)),
//                         title: Text("${expenseTransactions[index]['category']}",style:TextStyle(fontWeight: FontWeight.bold)),
//                         subtitle: Text("${expenseTransactions[index]['description']}"),
//                         trailing:
//                             Column(
//                               children: [
//                                 SizedBox(height: 10,),
//                                 Text("\$ ${expenseTransactions[index]['amount'].toString()}",style:TextStyle(color:expenseTransactions[index]['transactionscategory']=='income'? Colors.green:Colors.red,fontSize: 20,fontWeight: FontWeight.bold ),),
//                                 Text("${expenseTransactions[index]['date'].toString()} ${expenseTransactions[index]['time'].toString()}",style:TextStyle(color:expenseTransactions[index]['transactionscategory']=='income'? Colors.green:Colors.red),),
      
//                               ],
//                             ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
           
//           ],
//         ),
        
   
      
//       ),
//     );
//   }


import 'package:expensetracker/Utils/Image_Constant.dart';
import 'package:expensetracker/Widgets/UpdateTransaction.dart';
import 'package:expensetracker/hivefunctions.dart';
import 'package:expensetracker/presentation/TransactionScreen/Controller/TransuctionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:expensetracker/presentation/TransactionScreen/Model/TransactionModel.dart';

class TransactionnView extends GetWidget<TransactionnController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Transaction History'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Income'),
              Tab(text: 'Expenses'),
            ],
            onTap: (index) {
              controller.changeTab(index);
            },
          ),
        ),
        body: Obx(() {
          switch (controller.currentTab.value) {
            case 0:
              return _buildTransactionList(Transactions,controller);
            case 1:
              return _buildTransactionList(incomeTransactions,controller);
            case 2:
              return _buildTransactionList(expenseTransactions,controller);
            default:
              return Center(child: Text('No transactions available'));
          }
        }),
      ),
    );
  }

  // Widget _buildTransactionList(List transactions) {
  //   return transactions.isNotEmpty
  //       ? ListView.builder(
  //           itemCount: transactions.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             return ListTile(
  //               leading: transactions[index]['transactionscategory'] == 'income'
  //                   ? Image(image: AssetImage(ImageConstant.expensetransaction))
  //                   : Image(image: AssetImage(ImageConstant.incometransaction)),
  //               title: Text("${transactions[index]['category']}", style: TextStyle(fontWeight: FontWeight.bold)),
  //               subtitle: Text("${transactions[index]['description']}"),
  //               trailing: Column(
  //                 children: [
  //                   SizedBox(height: 10,),
  //                   Text("\$ ${transactions[index]['amount'].toString()}",
  //                     style: TextStyle(
  //                       color: transactions[index]['transactionscategory'] == 'income'
  //                           ? Colors.green
  //                           : Colors.red,
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                   Text("${transactions[index]['date'].toString()} ${transactions[index]['time'].toString()}",
  //                     style: TextStyle(
  //                       color: transactions[index]['transactionscategory'] == 'income'
  //                           ? Colors.green
  //                           : Colors.red,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //         )
  //       : Center(child: Text('No transactions available'));
  // }



Widget _buildTransactionList(List transactions, TransactionnController controller) {
  return transactions.isNotEmpty
      ? ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: transactions[index]['transactionscategory'] == 'income'
                  ? Image(image: AssetImage(ImageConstant.expensetransaction))
                  : Image(image: AssetImage(ImageConstant.incometransaction)),
              title: Text("${transactions[index]['category']}", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${transactions[index]['description']}"),
                  Row(
                    children: [
                      Text(
                        "\$ ${transactions[index]['amount'].toString()}",
                        style: TextStyle(
                          color: transactions[index]['transactionscategory'] == 'income'
                              ? Colors.green
                              : Colors.red,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "${transactions[index]['date'].toString()} ${transactions[index]['time'].toString()}",
                        style: TextStyle(
                          color: transactions[index]['transactionscategory'] == 'income'
                              ? Colors.green
                              : Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: PopupMenuButton<int>(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {

                      
                     Get.dialog(
              UpdateIncomeDialog(
                initialtansactioncategory: transactions[index]['transactionscategory'],
                id: transactions[index]['id'],
                initialCategory:transactions[index]['category'], // Example initial values
                initialDescription: transactions[index]['description'],
                initialAmount:transactions[index]['amount'],
                initialDate:transactions[index]['date'] ,
                initialtime:transactions[index]['time'] ,
                onUpdate:handleUpdate
               
            )); 
                    },
                    value: 1,
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('Edit'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: (){
                      controller.HomeControllerin.dbHelper.deleteTransaction(transactions[index]['id']);
                    },
                    value: 2,
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        SizedBox(width: 8),
                        
                        Text('Delete'),
                      ],
                    ),
                  ),
                ],
                onSelected: (value) {
                  if (value == 1) {
                    // Handle edit action
                    // Example: navigate to edit screen
                  } else if (value == 2) {
                    // Handle delete action
                    // Example: show confirmation dialog
                  }
                },
              ),
            );
          },
        )
      : Center(child: Text('No transactions available'));
}


}

  
void handleUpdate(String category, String description, double amount) {
  // Handle the update logic here, e.g., updating the state or saving to a database
  print('Category: $category, Description: $description, Amount: $amount');
}

// }
