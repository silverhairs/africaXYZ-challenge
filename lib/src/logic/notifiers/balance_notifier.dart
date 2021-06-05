import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceNotifier extends StateNotifier<double> {
  BalanceNotifier() : super(12966.56);

  void send(double amount) {
    state -= amount;
  }

  void recharge(double amount) {
    state += amount;
  }
}
