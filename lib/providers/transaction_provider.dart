import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction_model.dart';
import '../services/firestore_service.dart';

final firestoreProvider = Provider((ref) => FirestoreService());

final transactionProvider =
    StreamProvider<List<TransactionModel>>((ref) {
  return ref.read(firestoreProvider).getTransactions();
});
