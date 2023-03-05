import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test/services/database/lineItem.dart';

late String databasesPath, path;
late Database database;

openDB() async {
  try {
    databasesPath = await getDatabasesPath();

    path = join(databasesPath, 'ledgeere.db');

    database =
        await openDatabase(path, version: 1, singleInstance: true, onCreate: (
      Database db,
      int version,
    ) async {
      // When creating the db, create the table
      await db.execute(
        createTransactionListTable,
      );
    });
  } catch (e) {
    log(e.toString());
  }
}

isDBOpen() async {
  if (database.isOpen) {
    return true;
  }
  await openDB();
  return true;
}

addLineItem(LineItem lineItem) async {
  isDBOpen();

  String accountName = lineItem.accountName;
  double amount = lineItem.amount;
  String description = lineItem.description;
  String date = lineItem.transactionDate;
  String time = lineItem.transactionTime;

  await database.transaction((txn) async {
    await txn.rawInsert(
      'INSERT INTO $transactionListTable (Description, Amount, Account, Date, Time) VALUES($description,$amount,$accountName,$date,$time)',
    );
  });
}

updateLineItem(LineItem lineItem) async {
  isDBOpen();

  String accountName = lineItem.accountName;
  double amount = lineItem.amount;
  String description = lineItem.description;
  String date = lineItem.transactionDate;
  String time = lineItem.transactionTime;
  String UID = lineItem.UID!;

  int count = await database.rawUpdate(
    '''UPDATE $transactionListTable 
    SET Description = $description,  
    Amount = $amount, 
    Account = $accountName, 
    Date = $date, 
    Time = $time 
    ? WHERE UID = $UID''',
  );
  log(count.toString());
}

deleteLineItem(LineItem lineItem) async {
  isDBOpen();

  String UID = lineItem.UID!;

  int count = await database
      .rawDelete('DELETE FROM $transactionListTable WHERE UID = $UID');
  assert(count == 1);
}

const String transactionListTable = "transactionList";
const String createTransactionListTable =
    '''CREATE TABLE $transactionListTable (
	"UID"	INTEGER NOT NULL UNIQUE,
	"Description"	TEXT DEFAULT 'No description',
	"Amount"	REAL DEFAULT 'No amount',
	"Account"	TEXT,
	"Date"	TEXT,
	"Time"	TEXT,
	PRIMARY KEY("UID")
);''';
