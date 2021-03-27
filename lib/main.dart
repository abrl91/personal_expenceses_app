import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: '123a', title: 'New shoes', amount: 150.4, date: DateTime.now()),
    Transaction(id: '456b', title: 'Food', amount: 100, date: DateTime.now()),
    // Transaction(
    //     id: '789c', title: 'Keyboard', amount: 299.99, date: DateTime.now()),
    // Transaction(
    //     id: '321a', title: 'Laptop', amount: 549.80, date: DateTime.now()),
    // Transaction(id: '654b', title: 'Phone', amount: 220, date: DateTime.now()),
    // Transaction(id: '987c', title: 'Coffe', amount: 2.5, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 50,
            child: Card(
              color: Colors.grey,
              child: Text('chrat!'),
              elevation: 8,
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Add Yransaction'),
                    style: TextButton.styleFrom(
                        primary: Colors.blue,
                        textStyle: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic)),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((transaction) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${transaction.amount}',
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
                          transaction.title,
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(DateFormat.yMMMd().format(transaction.date),
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w300,
                                fontSize: 14)),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
