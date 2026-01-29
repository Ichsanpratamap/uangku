import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/transaction_model.dart';
import '../../providers/transaction_provider.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  final TransactionModel? transaction;

  const AddTransactionScreen({super.key, this.transaction});

  @override
  ConsumerState<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState
    extends ConsumerState<AddTransactionScreen> {
  late TextEditingController amountController;
  late TextEditingController noteController;
  late String type;

  @override
  void initState() {
    super.initState();

    amountController = TextEditingController(
      text: widget.transaction?.amount.toString() ?? '',
    );

    noteController = TextEditingController(
      text: widget.transaction?.note ?? '',
    );

    type = widget.transaction?.type ?? 'income';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.transaction == null
            ? 'Tambah Transaksi'
            : 'Edit Transaksi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: type,
              items: const [
                DropdownMenuItem(
                    value: 'income', child: Text('Pemasukan')),
                DropdownMenuItem(
                    value: 'expense', child: Text('Pengeluaran')),
              ],
              onChanged: (value) {
                setState(() {
                  type = value!;
                });
              },
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nominal'),
            ),
            TextField(
              controller: noteController,
              decoration: const InputDecoration(labelText: 'Catatan'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (amountController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Nominal wajib diisi')),
                  );
                  return;
                }

                final transaction = TransactionModel(
                  id: widget.transaction?.id ?? '',
                  type: type,
                  amount: int.parse(amountController.text),
                  category: '-',
                  note: noteController.text,
                  date:
                      widget.transaction?.date ?? DateTime.now(),
                );

                if (widget.transaction == null) {
                  await ref
                      .read(firestoreProvider)
                      .addTransaction(transaction);
                } else {
                  await ref
                      .read(firestoreProvider)
                      .updateTransaction(transaction);
                }

                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(

                const SnackBar(content: Text('Transaksi berhasil disimpan')),
              );
                Navigator.popUntil(context, (route) => route.isFirst );
              },
              child: Text(
                  widget.transaction == null ? 'Simpan' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
