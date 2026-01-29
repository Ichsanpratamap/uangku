import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uangku/screens/add_transaction/add_transaction_screen.dart';
import '../models/transaction_model.dart';
import '../providers/transaction_provider.dart';

class TransactionTile extends ConsumerWidget {
  final TransactionModel transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateFormat = DateFormat('dd MMM yyyy • HH:mm');

    return ListTile(
      leading: Icon(
        transaction.type == 'income'
            ? Icons.arrow_downward
            : Icons.arrow_upward,
        color: transaction.type == 'income'
            ? Colors.green
            : Colors.red,
      ),
      title: Text(
        transaction.note.isEmpty
            ? '(Tanpa catatan)'
            : transaction.note,
      ),
      subtitle: Text(
        dateFormat.format(transaction.date),
      ),
      trailing: Text(
        transaction.type == 'income'
            ? '+ ${transaction.amount}'
            : '- ${transaction.amount}',
        style: TextStyle(
          color: transaction.type == 'income'
              ? Colors.green
              : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),


      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                AddTransactionScreen(transaction: transaction),
          ),
        );
      },


      onLongPress: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Hapus Transaksi'),
            content:
                const Text('Yakin ingin menghapus transaksi ini?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Batal'),
              ),
              TextButton(
                onPressed: () async {
                  await ref
                      .read(firestoreProvider)
                      .deleteTransaction(transaction.id);

                  if (!context.mounted) return;
                  Navigator.pop(context);
                },
                child: const Text(
                  'Hapus',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
