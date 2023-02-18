import 'package:Personal_Expenses_App/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Personal_Expenses_App/Widgets/user_transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;

  TransactionList(this._userTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
                    child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.purpleAccent, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '₹${_userTransaction[index].amount.toStringAsFixed(2)}',
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
                            padding:
                                EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                            child: Text(
                              _userTransaction[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            )),
                        Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                            child: Text(
                              DateFormat('dd-MM-yyyy').format(_userTransaction[index].date),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ))
                      ],
                    )
                  ],
                )
              );
            },
        itemCount: _userTransaction.length,
      ),
    );
  }
}
