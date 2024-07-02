import 'dart:io';
import 'package:expensetracker/presentation/Expense/Controller/ExpenseController.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// List expensess=[];
// List income=[];
// class DBHelper {
//   static Database? _database;
//   static final DBHelper instance = DBHelper._privateConstructor();

//   DBHelper._privateConstructor();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, 'expense_tracker.db');
//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

// Future<void> _createDB(Database db, int version) async {
//   await db.execute('''
//     CREATE TABLE expenses (
//       id INTEGER PRIMARY KEY AUTOINCREMENT,
//       category TEXT,
//       amount REAL,
//       description TEXT,
//       imagePath TEXT
//     )
//   ''');

//   await db.execute('''
//     CREATE TABLE income (
//       id INTEGER PRIMARY KEY AUTOINCREMENT,
//       source TEXT,
//       amount REAL,
//       description TEXT,
//       imagePath TEXT
//     )
//   ''');
// }


//   Future<int> insertExpense(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     return await db.insert('expenses', row);
//   }

//    getAllExpenses( ) async {
//     Database db = await instance.database;
//      expensess = await db.query('expenses');
     
//     print(expensess);
//     return expensess;
//   }

//     Future<int> insertIncome(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     return await db.insert('income', row);
//   }

//    getAllIncome( ) async {
//     Database db = await instance.database;
//      expensess = await db.query('income');
     
//     print(expensess);
//     return expensess;
//   }
// }



RxList Transactions=[].obs;
RxList incomeTransactions=[].obs;
RxList expenseTransactions=[].obs;
RxList TodayTransactions=[].obs;
RxList ThisWeakTransactions=[].obs;
RxList ThisMonthTransactions=[].obs;
// RxList Transactions=[].obs;
var TotalIncome=0.0.obs;
var TotalExpenses=0.0.obs;
var Totalbalace=0.0.obs;


class DatabaseHelper extends GetxController {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'income_expense.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        transactionscategory TEXT,
        category TEXT,
        date TEXT,
        time TEXT,
        description TEXT,
        amount REAL
      )
    ''');
  }

Future<int> insertTransaction(Map<String, dynamic> transaction) async {
    final db = await database;
    int id = await db.insert('transactions', transaction);
    _printTransactions();
    return id;
  }

  Future<List<Map<String, dynamic>>> getTransactions() async {
    final db = await database;
    return await db.query('transactions');
  }

  Future<int> updateTransaction(Map<String, dynamic> transaction) async {
    final db = await database;
    int id = transaction['id'];
    _printTransactions();
     await db.update(
      'transactions',
      transaction,
      where: 'id = ?',
      whereArgs: [id],

   
    );
             _printTransactions();
    printIncomingTransactions();
    printExpenseTransactions();
     return 0;
  }

  Future<int> deleteTransaction(int id) async {
    final db = await database;
     await db.delete(
      'transactions',
      where: 'id = ?',
      whereArgs: [id],
    );
    _printTransactions();
    printIncomingTransactions();
    printExpenseTransactions();
    return 0;
  }

  Future<void> _printTransactions() async {
   Transactions.value = await getTransactions();
    print('Current Transactions:');
    Transactions.forEach((transaction) {
      print(transaction);
      Transactions.refresh();
    
    });
    getTotalIncome();
    getTotalExpenses();
     TotalExpenses .value= await getTotalExpenses();
 

Totalbalace.value= TotalIncome .value- TotalExpenses .value;
Transactions;
update();
  }


Future<void> printIncomingTransactions() async {
   incomeTransactions.value = await getIncomeTransactions();
    print('Current Transactions:');
    incomeTransactions.forEach((transaction) {
      print(transaction);
      incomeTransactions.refresh();
    
    });

  }

Future<void> printExpenseTransactions() async {
   expenseTransactions.value = await getExpenseTransactions();
    print('Current Transactions:');
    expenseTransactions.forEach((transaction) {
      print(transaction);
      expenseTransactions.refresh();
    
    });

  }
  Future<List<Map<String, dynamic>>> getIncomeTransactions() async {
  final db = await database;
  // Query to get transactions where the category is 'income'
  final result = await db.query(
    'transactions',
    where: 'transactionscategory = ?',
    whereArgs: ['income'],
  );
  return result;
}

Future<double> getTotalIncome() async {
  final db = await database;
  // Calculate the total amount for income transactions
   var retult = await db.rawQuery(
    'SELECT SUM(amount) as totalIncome FROM transactions WHERE transactionscategory = ?',
    ['income'],
  );
  if (retult.isNotEmpty) {
    TotalIncome.value=retult.first ['totalIncome'] as double? ?? 0.0;
    print("total income ${TotalIncome.value}");
  }
  return  TotalIncome.value;
}



Future<List<Map<String, dynamic>>> getExpenseTransactions() async {
  final db = await database;
  // Query to get transactions where the category is 'expenses'
  final result = await db.query(
    'transactions',
    where: 'transactionscategory = ?',
    whereArgs: ['expenses'],
  );
  return result;
}

Future<double> getTotalExpenses() async {
  final db = await database;
  // Calculate the total amount for expense transactions
  var result = await db.rawQuery(
    'SELECT SUM(amount) as totalExpenses FROM transactions WHERE transactionscategory = ?',
    ['expenses'],
  );
  if (result.isNotEmpty) {
    TotalExpenses.value = result.first['totalExpenses'] as double? ?? 0.0;
    print("total expenses ${TotalExpenses.value}");
  }
  return TotalExpenses.value;
}


Future<List<Map<String, dynamic>>> getTransactionsByToday() async {
  final db = await database;

  DateTime today = DateTime.now();
    String formattedDate = '${today.day}/${today.month}/${today.year}';
print("selected date $formattedDate");
  final result = await db.query(
    'transactions',
    where: 'date = ?',
    whereArgs: [formattedDate],
  );

  return result;
}

Future<void> printTodayTransactions() async {
   TodayTransactions.value = await getTransactionsByToday();
    TodayTransactions.forEach((transaction) {
    print('today Transactions:$transaction');

      // print(transaction);
      TodayTransactions.refresh();
    
    });

  }
Future<List<Map<String, dynamic>>> getTransactionsByWeek() async {
  final db = await database;

  // Get the current date
  DateTime now = DateTime.now();

  // Calculate the start and end dates of the week
  DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  DateTime endOfWeek = startOfWeek.add(Duration(days: 6));

   // Format the dates to strings
    String start = '${startOfWeek.day}/${startOfWeek.month}/${startOfWeek.year}';
    String end = '${endOfWeek.day}/${endOfWeek.month}/${endOfWeek.year}';

  final result = await db.query(
    'transactions',
    where: 'date >= ? AND date <= ?',
    whereArgs: [start, end],
  );

  return result;
}



Future<void> printweakTransactions() async {
   ThisWeakTransactions.value = await getTransactionsByWeek();
    ThisWeakTransactions.forEach((transaction) {
    print('today Transactions:$transaction');

      // print(transaction);
      ThisWeakTransactions.refresh();
    
    });

  }
Future<List<Map<String, dynamic>>> getTransactionsByMonth() async {
  final db = await database;

  // Get the current date
  DateTime now = DateTime.now();

  // Calculate the start and end dates of the month
  DateTime startOfMonth = DateTime(now.year, now.month, 1);
  DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);

  // Format the dates to strings
    String start = '${startOfMonth.day}/${startOfMonth.month}/${startOfMonth.year}';
    String end = '${endOfMonth.day}/${endOfMonth.month}/${endOfMonth.year}';

  final result = await db.query(
    'transactions',
    where: 'date >= ? AND date <= ?',
    whereArgs: [start, end],
  );

  return result;
}



Future<void> printmonthTransactions() async {
   ThisMonthTransactions.value = await getTransactionsByMonth();
    ThisMonthTransactions.forEach((transaction) {
    print('today Transactions:$transaction');

      // print(transaction);
      ThisMonthTransactions.refresh();
    
    });

  }


  

}
