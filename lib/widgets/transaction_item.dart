import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text("Delete"),
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              ),
      ),

      // OTHER POSSIBLE STYLING
      // return Card(
      //   child: Row(
      //     children: <Widget>[
      //       Container(
      //         margin: EdgeInsets.symmetric(
      //           vertical: 10,
      //           horizontal: 15,
      //         ),
      //         decoration: BoxDecoration(
      //           border: Border.all(
      //             color: Theme.of(context).primaryColor,
      //             width: 2,
      //           ),
      //         ),
      //         padding: EdgeInsets.all(10),
      //         child: Text(
      //           '\$' +
      //               transaction.amount.toStringAsFixed(
      //                   2), //Can do the same by '\$${tx.amount}'
      //           style: Theme.of(context).textTheme.title,
      //           // TextStyle(
      //           //   fontWeight: FontWeight.bold,
      //           //   fontSize: 20,
      //           //   color: Theme.of(context).pri,
      //           // ),
      //         ),
      //       ),
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: <Widget>[
      //           Text(
      //             transaction.title,
      //             style: TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           Text(
      //             DateFormat.yMMMd().format(transaction.date),
      //             style: TextStyle(
      //               color: Colors.grey,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // );
    );
  }
}
