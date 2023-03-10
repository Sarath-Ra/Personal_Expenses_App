import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTransaction;

  NewTransaction(this._addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget._addNewTransaction(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

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
              controller: _titleController,
              onSubmitted: (_) => _submitData,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            // ignore: prefer_const_constructors
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              // onChanged: (val) {
              //   amountInput = val;
              // },
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    _selectedDate == null
                        ? 'No Date Choosen'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                  )),
                  TextButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              // ignore: prefer_const_constructors
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// from state less widget we need to convert this into a stateful widget so that we don't loose the data whenever we go for the next input field
// because of this we can circulate the data inside them

// But from time to time, Flutter does that.

// And for a state less widget, a widget being re-evaluated means that any internally stored data is reset,

// is lost.

// That's why we lose our user input in a stateless widget because whenever it is re-evaluated by flutter,

// for whatever reason we lose the state that is currently stored in there.

// We lose our data that's stored in there.

// And for a state full widget that's different there we have that separate state object, that state class,

// and whilst the widget they are also would be reevaluated by flutter, the state kind of is detached

// from this and data stored in that state will not be lost if the widget that belongs to it is reevaluated

// by flutter.

// So we have a separation of data and the UI you could say, and therefore we can persist data.

// And it's not lost when something changes on the screen or when Flutter decides that it wants to reevaluate

// that widget.

// That's why our data is then persistent, and that's why we need a stateful widget here.


/*

It gives us this widget property and this refactoring step automatically added it.

With Widget Dot, you can access the properties and methods of your widget class inside of your state

class.

So with widget dot add x, I can access to add htc's property, which is this function reference I get

even though I'm technically in a different class.




It has to be named widget and it's only available in your state classes.
*/