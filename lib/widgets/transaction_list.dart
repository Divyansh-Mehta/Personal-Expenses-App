import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "../models/transaction.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  const TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(children: <Widget>[
                Text(
                  "No Transaction Yet",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    )),
              ]);
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text("\$${transactions[index].amount}"),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          icon: const Icon(Icons.delete),
                          label: const Text("Delete"),
                          textColor: Theme.of(context).errorColor,
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          })
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          },
                        ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
