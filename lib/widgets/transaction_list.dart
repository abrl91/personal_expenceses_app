import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text('There are no incomes / expences yet'),
                  SizedBox(height: 15),
                  Container(
                      height: 300,
                      //margin: EdgeInsets.symmetric(vertical: 25),
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover))
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                                '\$${transactions[index].amount.toStringAsFixed(2)}'),
                          ),
                        ),
                      ),
                      title: Text(transactions[index].title),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date)),
                      trailing: IconButton(
                        onPressed: () =>
                            deleteTransaction(transactions[index].id),
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
