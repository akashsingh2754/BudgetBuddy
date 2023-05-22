import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trascation.dart';
import '../widgets/chart_bar.dart';

class charts extends StatelessWidget {
  List<Transction> recenttransction;

  charts(this.recenttransction);

  List<Map<String, Object>> get groupedTrasctionvalues {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalsum = 0.0;
        for (var i = 0; i < recenttransction.length; i++) {
          if (recenttransction[i].date.day == weekday.day &&
              recenttransction[i].date.month == weekday.month &&
              recenttransction[i].date.year == weekday.year) {
            totalsum += recenttransction[i].amount;
          }
        }
        ;
        return {
          'day': DateFormat.E().format(weekday).substring(0, 1),
          'amount': 12.99,
        };
      },
    );
  }

  double get totalspending {
    return groupedTrasctionvalues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(22),
      child: Row(
        children: groupedTrasctionvalues.map((data) {
          return ChartBar(data['day'] as String, (data['amount'] as double),
              (data['amount'] as double) / totalspending);
        }).toList(),
      ),
    );
  }
}
