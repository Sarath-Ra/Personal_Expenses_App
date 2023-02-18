import 'package:Personal_Expenses_App/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  final List<Transaction> transaction = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 99.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "Groceries", amount: 49.99, date: DateTime.now())
  ];

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
      body: Column(
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
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // ignore: prefer_const_constructors
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                      // onChanged: (val) {
                      //   titleInput = val;
                      // },
                    ),
                    // ignore: prefer_const_constructors
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                      // onChanged: (val) {
                      //   amountInput = val;
                      // },
                      keyboardType: TextInputType.number,
                    ),
                    TextButton(
                      onPressed: () {
                        print(titleController.text);
                        print(amountController.text);
                      },
                      child: Text(
                        "Add Transaction",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: transaction
                  .map((tx) => Card(
                          child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.purpleAccent, width: 2)),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '₹${tx.amount}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 10),
                                  child: Text(
                                    tx.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  )),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 10),
                                  child: Text(
                                    DateFormat('dd-MM-yyyy').format(tx.date),
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ))
                            ],
                          )
                        ],
                      )))
                  .toList(),
            ),
          ]),
    );
  }
}
