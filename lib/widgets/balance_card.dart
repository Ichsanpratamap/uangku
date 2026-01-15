import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/transaction_provider.dart';
import '../core/utils/format_currency.dart';

class BalanceCard extends ConsumerWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(transactionProvider);

    return data.when(
      data: (list) {
        int balance = 0;
        for (var t in list) {
          balance += t.type == 'income' ? t.amount : -t.amount;
        }
        return Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Saldo: ${formatRupiah(balance)}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        );
      },
      loading: () => const SizedBox(),
      error: (_, __) => const SizedBox(),
    );
  }
}
