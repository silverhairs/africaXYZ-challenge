import 'dart:async';

enum KeyboardInputEvent {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  zero,
  dot,
  delete
}

class AmountInputState {
  String amount;
  AmountInputState({this.amount = ''});

  AmountInputState copyWith({String? amount}) {
    return AmountInputState(amount: amount ?? this.amount);
  }

  void setAmount(String value) => amount = amount + value;

  static final empty = AmountInputState();

  AmountInputState delete() {
    var newVal = '';
    if (this != AmountInputState.empty) {
      newVal = amount.substring(0, amount.length - 1);
    }
    return AmountInputState(amount: newVal);
  }
}

class AmountInputBloc {
  var _amountState = AmountInputState();

  final _stateController = StreamController<AmountInputState>.broadcast();
  StreamSink<AmountInputState> get _statePipe => _stateController.sink;
  Stream<AmountInputState> get state => _stateController.stream;

  final _eventController = StreamController<KeyboardInputEvent>();
  Sink<KeyboardInputEvent> get eventPipe => _eventController.sink;

  AmountInputBloc() {
    _eventController.stream.listen((input) {
      switch (input) {
        case KeyboardInputEvent.zero:
          _amountState.setAmount('0');
          break;
        case KeyboardInputEvent.one:
          _amountState.setAmount('1');
          break;
        case KeyboardInputEvent.two:
          _amountState.setAmount('2');
          break;
        case KeyboardInputEvent.three:
          _amountState.setAmount('3');
          break;
        case KeyboardInputEvent.four:
          _amountState.setAmount('4');
          break;
        case KeyboardInputEvent.five:
          _amountState.setAmount('5');
          break;
        case KeyboardInputEvent.six:
          _amountState.setAmount('6');
          break;
        case KeyboardInputEvent.seven:
          _amountState.setAmount('7');
          break;
        case KeyboardInputEvent.eight:
          _amountState.setAmount('8');
          break;
        case KeyboardInputEvent.nine:
          _amountState.setAmount('9');
          break;
        case KeyboardInputEvent.dot:
          _amountState.setAmount('.');
          break;
        case KeyboardInputEvent.delete:
          _amountState = _amountState.delete();
          break;
      }
      _statePipe.add(_amountState);
    });
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
  }
}
