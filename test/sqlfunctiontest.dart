import 'package:expensetracker/hivefunctions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Import sqflite_common_ffi

void main() {

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;



  test('insertTransaction should insert a transaction and return its id', () async {
    bool done = false;
    int? result;
    result = await DatabaseHelper().insertTransaction({
      'category': "Shopping",
      'transactionscategory': 'income',
      'description': "done some shoppings",
      'amount': 200.0,
      'date': "23/7/2024",
      'time': "10:00"
    });

    if (result == null) {
      done = false;
    }else{
      done = true;

    }
    expect(done, true);
  });



  test('updateTransaction should insert a transaction and return its id', () async {
    bool done = false;
    int? result;
    result = await DatabaseHelper().updateTransaction({
      'id':002,
      'category': "Shopping",
      'transactionscategory': 'income',
      'description': "done some shoppings",
      'amount': 200.0,
      'date': "23/7/2024",
      'time': "10:00"
    });

    if (result == null) {
      done = false;
    }else{
      done = true;

    }
    expect(done, true);
  });



  test('insertTransaction should insert a transaction and return its id', () async {
    bool done = false;
    List<Map<String, dynamic>> result;
    result = await DatabaseHelper().getTransactions();

    if (result.isEmpty) {
      done = false;
    }else{
      done = true;

    }
    expect(done, true);
  });




  test('insertTransaction should insert a transaction and return its id', () async {
    bool done = false;
    int result;
    result = await DatabaseHelper().deleteTransaction(002);

    if (result==null) {
      done = false;
    }else{
      done = true;

    }
    expect(done, true);
  });




   test('insertTransaction should insert a transaction and return its id', () async {
    bool done = false;
    List<Map<String, dynamic>> result;
    result = await DatabaseHelper().getIncomeTransactions();

    if (result==null) {
      done = false;
    }else{
      done = true;

    }
    expect(done, true);
  });
}
