import 'dart:math';

import 'package:flutter/material.dart';
import 'package:traineeapp/models/transiction.dart';
import 'package:intl/intl.dart';

class TransicationItem extends StatefulWidget {
  const TransicationItem({
    Key key,
    @required this.transactions,
    @required this.deleteTx,
  }) : super(key: key);
  final Transaction transactions;
  final Function deleteTx;

  @override
  _TransicationItemState createState() => _TransicationItemState();
}

class _TransicationItemState extends State<TransicationItem> {
Color _rbgColor;
  @override
  void initState() {
   const avaliableColors=[
     Colors.red,
     Colors.purpleAccent,
     Colors.purple,
     Colors.deepPurpleAccent,
     Colors.deepPurple,
   ];
   _rbgColor=avaliableColors[Random().nextInt(5)];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.00,
      margin: EdgeInsets.symmetric(
        vertical: 10.00,
        horizontal: 15.00,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _rbgColor,
          radius: 30.00,
          child: Padding(
            padding: EdgeInsets.all(6.00),
            child: FittedBox(
              child: Text('\$${widget.transactions.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.transactions.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transactions.dateTime),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                textColor: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.transactions.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.transactions.id),
              ),
      ),
    );
  }
}
