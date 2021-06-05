import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paypal_app/src/data/transaction.dart';
import 'package:paypal_app/src/logic/notifiers/balance_notifier.dart';
import 'package:paypal_app/src/logic/notifiers/transaction_notifier.dart';

class Providers {
  static final transactionsListProvider =
      StateNotifierProvider<TransactionsListNotifier, List<Transaction>>(
    (ref) => TransactionsListNotifier(),
  );

  static final balanceProvier = StateNotifierProvider<BalanceNotifier, double>(
    (ref) => BalanceNotifier(),
  );
}
