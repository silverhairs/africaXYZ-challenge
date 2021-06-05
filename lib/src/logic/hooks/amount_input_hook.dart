import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:paypal_app/src/logic/amount_input_bloc.dart';

AmountInputBloc useAmountInputBloc() => use(_AmountInput());

class _AmountInput extends Hook<AmountInputBloc> {
  @override
  __AmountInputState createState() => __AmountInputState();
}

class __AmountInputState extends HookState<AmountInputBloc, _AmountInput> {
  var inputBloc = AmountInputBloc();
  @override
  AmountInputBloc build(BuildContext context) {
    return inputBloc;
  }

  @override
  void dispose() {
    inputBloc.dispose();
    super.dispose();
  }
}
