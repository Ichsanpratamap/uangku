import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../core/utils/format_currency.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(transaction.note),
      subtitle: Text(transaction.type),
      trailing: Text(formatRupiah(transaction.amount)),
    );
  }
}
