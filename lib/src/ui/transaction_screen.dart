import 'package:another_flushbar/flushbar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paypal_app/src/data/contact.dart';
import 'package:paypal_app/src/data/transaction.dart';
import 'package:paypal_app/src/logic/amount_input_bloc.dart';
import 'package:paypal_app/src/logic/hooks/amount_input_hook.dart';
import 'package:paypal_app/src/logic/providers.dart';
import 'package:paypal_app/src/ui/layout.dart';
import 'package:paypal_app/src/ui/login_screen.dart';
import 'package:paypal_app/src/utils/styles.dart';

import 'components/contact_selector.dart';
import 'components/transaction_input_field.dart';
import 'components/transaction_keyboard.dart';

class TransactionScreen extends HookWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBloc = useAmountInputBloc();
    final amountInputStream = useStream<AmountInputState>(
      inputBloc.state,
      initialData: AmountInputState.empty,
    );

    final receverState = useState<Contact>(Contact.empty);
    final balance = useProvider(Providers.balanceProvier);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Send Money',
          style: TextStyle(color: AppColors.dark),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(EvaIcons.arrowBack),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: ListTile(
                onTap: () => showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => ContactSelector(
                    onSelect: (contact) => receverState.value = contact,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: AppColors.dark.withOpacity(0.2),
                  child: Icon(
                    FlutterRemix.user_fill,
                    color: AppColors.light,
                    size: 32,
                  ),
                ),
                title: Text(
                  'To:',
                  style: TextStyle(
                    color: AppColors.dark.withOpacity(0.3),
                  ),
                ),
                isThreeLine: true,
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      receverState.value.isEmpty
                          ? 'Press Here'
                          : receverState.value.name,
                      style: TextStyle(
                          color: AppColors.dark,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      receverState.value.isEmpty
                          ? 'To select a receiver'
                          : receverState.value.email,
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TransactionInputField(inputStream: amountInputStream),
            ),
            TransactionKeyboard(inputBloc: inputBloc),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 20),
              sliver: SliverToBoxAdapter(
                child: CustomButton(
                  text: 'Send',
                  onPressed: () {
                    try {
                      double amount =
                          double.parse(amountInputStream.data!.amount);

                      if (receverState.value.isEmpty) {
                        throw UserNotSlectedException();
                      }
                      if (amount >= balance) {
                        throw InsuficientFundsException();
                      }
                      if (amount > 0.0) {
                        context
                            .read(Providers.balanceProvier.notifier)
                            .send(amount);
                        context
                            .read(Providers.transactionsListProvider.notifier)
                            .makeTransaction(
                              Transaction(
                                amount: amount,
                                to: receverState.value,
                              ),
                            );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => MainLayout(),
                          ),
                        );
                        Flushbar(
                          margin: EdgeInsets.all(16),
                          flushbarPosition: FlushbarPosition.TOP,
                          duration: Duration(seconds: 3),
                          borderRadius: BorderRadius.circular(16),
                          backgroundColor: AppColors.green,
                          title: 'Success',
                          message:
                              "You've sent \$ $amount to ${receverState.value.name}!",
                          icon: Icon(
                            EvaIcons.checkmarkCircle,
                            color: AppColors.white,
                          ),
                        )..show(context);
                      }
                    } catch (e) {
                      Flushbar(
                        margin: EdgeInsets.all(16),
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: Duration(seconds: 3),
                        borderRadius: BorderRadius.circular(16),
                        title: 'Failed',
                        message: e is UserNotSlectedException
                            ? 'Please select a receiver'
                            : e is InsuficientFundsException
                                ? 'Insufficient funds!'
                                : 'Transaction Failed!',
                        backgroundColor: AppColors.red,
                        icon: Icon(
                          EvaIcons.closeCircle,
                          color: AppColors.white,
                        ),
                      )..show(context);
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserNotSlectedException implements Exception {}

class InsuficientFundsException implements Exception {}
