import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$${transactions[index].amount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.purple),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].title,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(DateFormat.yMMMd().format(transactions[index].date),
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w300,
                              fontSize: 14)),
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: transactions.length,
        ));
  }
}
