import 'package:Personal_Expenses_App/Widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:Personal_Expenses_App/Widgets/new_transaction.dart';
import 'package:Personal_Expenses_App/models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 99.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "Groceries", amount: 49.99, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
