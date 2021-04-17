import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  dynamic _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enterredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enterredAmount <= 0 || _selectedDate == null) {
      return;
    }

    // access the properties and methods of the widget class (NewTransaction)
    // inside the state class (_NewTransactionState)
    widget.addTx(enteredTitle, enterredAmount, _selectedDate);

// contex is a property which is available classwide
// it's made available because we extends state
    Navigator.of(context).pop();
  }

  void _precentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
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
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              // _ => we must get an argument but we don't need one, therefore in
              // order not to get an error, we pass '_'
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen'
                          : DateFormat.yMd().format(_selectedDate),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                      onPressed: _precentDatePicker, child: Text('Choose Date'))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Submit'),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Theme.of(context).accentColor,
                  textStyle:
                      TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
            )
          ],
        ),
      ),
    );
  }
}
