import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _addNewTransaction;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this._addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                _addNewTransaction(titleController.text, double.parse(amountController.text));
              },
              // ignore: prefer_const_constructors
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
