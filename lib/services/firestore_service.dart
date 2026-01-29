import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/transaction_model.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;
  final _collection = 'transactions';

  Future<void> addTransaction(TransactionModel transaction) async {
    await _db.collection(_collection).add(transaction.toMap());
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    await _db
        .collection(_collection)
        .doc(transaction.id)
        .update(transaction.toMap());
  }

  Future<void> deleteTransaction(String id) async {
    await _db.collection(_collection).doc(id).delete();
  }

  Stream<List<TransactionModel>> getTransactions() {
    return _db
        .collection(_collection)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (doc) => TransactionModel.fromMap(
                doc.id, 
                doc.data(),
              ),
            )
            .toList());
  }
}
