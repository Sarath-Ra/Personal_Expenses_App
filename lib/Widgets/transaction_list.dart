import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  final Function _deleteTransaction;

  TransactionList(this._userTransaction, this._deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _userTransaction.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions Added Yet !!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 350,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      // instead of having a circle avatar we can have a container and we can decide the shape and color it and specify the height and weight to create our own box
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text("\$${_userTransaction[index].amount}")),
                      ),
                    ),
                    title: Text(
                      _userTransaction[index].title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(_userTransaction[index].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => _deleteTransaction(_userTransaction[index].id),
                    ),
                  ),
                );
              },
              itemCount: _userTransaction.length,
            ),
    );
  }
}


          // Card(
          //     child: Row(
          //   children: [
          //     Container(
          //       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          //       decoration: BoxDecoration(
          //           border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
          //       padding: EdgeInsets.all(10),
          //       child: Text(
          //         '₹${_userTransaction[index].amount.toStringAsFixed(2)}',
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 20,
          //           color: Theme.of(context).primaryColor,
          //         ),
          //       ),
          //     ),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //             padding:
          //                 EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          //             child: Text(
          //               _userTransaction[index].title,
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 16,
          //                 color: Colors.black87,
          //               ),
          //             )),
          //         Container(
          //             padding:
          //                 EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          //             child: Text(
          //               DateFormat('dd-MM-yyyy')
          //                   .format(_userTransaction[index].date),
          //               style: TextStyle(
          //                 fontWeight: FontWeight.normal,
          //                 color: Colors.grey,
          //               ),
          //             ))
          //       ],
          //     )
          //   ],
          // ))