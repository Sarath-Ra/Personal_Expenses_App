import 'package:Personal_Expenses_App/transaction.dart';
import 'package:flutter/material.dart';

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

  final List<Transaction> transaction = [Transaction(id: "t1", title: "New Shoes", amount: 99.99, date: DateTime.now()), Transaction(id: "t2", title: "Groceries", amount: 49.99, date: DateTime.now())];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses Tracker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.purple,
              elevation: 5,
              child: Text("CHART!"),
            )
          ),
          Column(
            children: transaction.map((tx) => Card(
              child: Row(children: [
                Container(
                  child: Text(tx.amount.toString()),
                ),
                Column(
                  children: [
                    Text(tx.title),
                    Text(tx.date.toString()),
                  ],
                )
              ],)
            )).toList(),
          ),
        ]
      ),
    );
  }
}
