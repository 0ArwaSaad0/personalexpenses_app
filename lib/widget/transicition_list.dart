import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:traineeapp/models/transiction.dart';

import 'transication_item.dart';


class TransactionsList extends StatelessWidget {

  final List  transactions;
  final Function deleteTx;
TransactionsList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('build() TransicationList' );
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constriant) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                 const SizedBox(
                  height: 20,
                ),
                Container(
                    height: constriant.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/empty.jpg',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView(children:[
     ...transactions.map((tx)=>TransicationItem(
       key: UniqueKey(),
      transactions:tx,
      deleteTx: deleteTx,
    )).toList()
    ]
          );
  }
}
