import 'package:cloud_firestore/cloud_firestore.dart';


class TransactionModel {
  final String id;
  final String type;
  final int amount;
  final String category;
  final String note;
  final DateTime date;

  TransactionModel({
    required this.id,
    required this.type,
    required this.amount,
    required this.category,
    required this.note,
    required this.date,
  });

   Map<String, dynamic> toMap() {
    return {
      'type': type,
      'amount': amount,
      'category': category,
      'note': note,
      'date': Timestamp.fromDate(date), 
    };
  }

  factory TransactionModel.fromMap(
      String id, Map<String, dynamic> map) {
    return TransactionModel(
      id: id,
      type: map['type'],
      amount: map['amount'],
      category: map['category'],
      note: map['note'],
      date: (map['date'] as Timestamp).toDate(), 
    );
  }
}