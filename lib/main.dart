import 'package:Personal_Expenses_App/Widgets/new_transaction.dart';
import 'package:Personal_Expenses_App/Widgets/transaction_list.dart';
import 'package:Personal_Expenses_App/Widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Personal_Expenses_App/models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  // MyHomePage({super.key});

  // late String titleInput;
  // late String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses Tracker"),
      ),
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  width: double.infinity,
                  child: const Card(
                    color: Colors.purple,
                    elevation: 5,
                    child: Text("CHART!"),
                  )),
              UserTransactions(),
            ]),
      ),
    );
  }
}
