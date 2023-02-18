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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // MyHomePage({super.key});
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void startAddNewTransaction(
    BuildContext ctx,
  ) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return NewTransaction(_addNewTransaction)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses Tracker"),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.add),
          ),
        ],
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
