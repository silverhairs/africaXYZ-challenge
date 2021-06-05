import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:paypal_app/src/logic/amount_input_bloc.dart';
import 'package:paypal_app/src/utils/styles.dart';

class TransactionKeyboard extends StatelessWidget {
  const TransactionKeyboard({
    Key? key,
    required this.inputBloc,
  }) : super(key: key);

  final AmountInputBloc inputBloc;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 12,
        mainAxisExtent: 75,
        childAspectRatio: 0.1,
      ),
      delegate: SliverChildListDelegate(
        [
          TransactionKeyboardKey(
            text: '1',
            onPressed: () => inputBloc.eventPipe.add(KeyboardInputEvent.one),
          ),
          TransactionKeyboardKey(
            text: '2',
            onPressed: () => inputBloc.eventPipe.add(KeyboardInputEvent.two),
          ),
          TransactionKeyboardKey(
            text: '3',
            onPressed: () => inputBloc.eventPipe.add(KeyboardInputEvent.three),
          ),
          TransactionKeyboardKey(
            text: '4',
            onPressed: () => inputBloc.eventPipe.add(KeyboardInputEvent.four),
          ),
          TransactionKeyboardKey(
            text: '5',
            onPressed: () => inputBloc.eventPipe.add(KeyboardInputEvent.five),
          ),
          TransactionKeyboardKey(
            text: '6',
            onPressed: () => inputBloc.eventPipe.add(KeyboardInputEvent.six),
          ),
          TransactionKeyboardKey(
            text: '7',
            onPressed: () => inputBloc.eventPipe.add(KeyboardInputEvent.seven),
          ),
          TransactionKeyboardKey(
            text: '8',
            onPressed: () => inputBloc.eventPipe.add(KeyboardInputEvent.eight),
          ),
          TransactionKeyboardKey(
            text: '9',
            onPressed: () => inputBloc.eventPipe.add(KeyboardInputEvent.nine),
          ),
          TransactionKeyboardKey(
            text: '0',
            onPressed: () => inputBloc.eventPipe.add(KeyboardInputEvent.zero),
          ),
          TransactionKeyboardKey(
            text: '.',
            onPressed: () => inputBloc.eventPipe.add(KeyboardInputEvent.dot),
          ),
          TransactionKeyboardKey(
            isIcon: true,
            onPressed: () => inputBloc.eventPipe.add(KeyboardInputEvent.delete),
          ),
        ],
      ),
    );
  }
}

class TransactionKeyboardKey extends StatelessWidget {
  const TransactionKeyboardKey({
    this.text,
    required this.onPressed,
    this.isIcon = false,
    Key? key,
  }) : super(key: key);

  final bool isIcon;
  final String? text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(300),
        ),
        color: AppColors.white,
        child: Center(
          child: !isIcon
              ? Text(
                  text!,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.dark,
                      ),
                )
              : Icon(FlutterRemix.delete_back_2_line, size: 32),
        ),
      ),
    );
  }
}
