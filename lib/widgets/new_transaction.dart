import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

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
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                addTx(
                    titleController.text, double.parse(amountController.text));
              },
              child: Text('Add Yransaction'),
              style: TextButton.styleFrom(
                  primary: Colors.blue,
                  textStyle:
                      TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
            )
          ],
        ),
      ),
    );
  }
}
