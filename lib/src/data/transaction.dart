import 'package:equatable/equatable.dart';
import 'package:paypal_app/src/data/contact.dart';

// ignore: must_be_immutable
class Transaction extends Equatable {
  final Contact from;
  final Contact to;
  final double amount;
  DateTime transactionDate;

  Transaction({
    required this.amount,
    this.from = const Contact(name: 'Me', email: 'developer@me.com'),
    required this.to,
    DateTime? transactionDate,
  }) : transactionDate = transactionDate ?? DateTime.now();

  @override
  List<Object?> get props => [
        from,
        to,
        amount,
        transactionDate,
      ];
}
