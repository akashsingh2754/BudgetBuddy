import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Transction {
  final String id;
  final String tittle;
  final double amount;
  final DateTime date;
  Transction(
      {required this.id,
      required this.amount,
      required this.tittle,
      required this.date});
}
