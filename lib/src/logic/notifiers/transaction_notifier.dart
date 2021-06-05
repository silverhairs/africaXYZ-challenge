import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paypal_app/src/data/transaction.dart';

class TransactionsListNotifier extends StateNotifier<List<Transaction>> {
  TransactionsListNotifier() : super(<Transaction>[]);

  void makeTransaction(Transaction transaction) {
    state.add(transaction);
  }

  void deleteTransaction(Transaction transaction) {
    if (state.contains(transaction)) {
      state.remove(transaction);
    }
  }
}
