import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myexpenses/models/trascation.dart';
import '../main.dart';

class TransctionList extends StatelessWidget {
  final List<Transction> transctions;

  TransctionList(this.transctions);

  void deletetransction(String id) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transctions.isEmpty
          ? Column(
              children: <Widget>[
                Text('no transactions found!',
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (BuildContext ctx, int index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text('\$${transctions[index].amount}')),
                        ),
                      ),
                      title: Text(transctions[index].tittle,
                          style: Theme.of(context).textTheme.titleMedium),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transctions[index].date)),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                      )),
                );
              },
              itemCount: transctions.length,
            ),
    );
  }
}
