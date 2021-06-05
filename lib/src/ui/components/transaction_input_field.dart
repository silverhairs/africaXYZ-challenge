import 'package:flutter/material.dart';
import 'package:paypal_app/src/logic/amount_input_bloc.dart';
import 'package:paypal_app/src/utils/styles.dart';

class TransactionInputField extends StatelessWidget {
  const TransactionInputField({
    Key? key,
    required this.inputStream,
  }) : super(key: key);

  final AsyncSnapshot<AmountInputState?> inputStream;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.deepBlue, width: 2),
      ),
      child: inputStream.data!.amount.isEmpty
          ? Text(
              '\$ 0',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: AppColors.dark,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
            )
          : Text(
              '\$ ${inputStream.data!.amount}',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: AppColors.dark,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
            ),
    );
  }
}
