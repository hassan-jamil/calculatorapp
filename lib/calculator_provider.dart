import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  String _display = '0';
  String _operation = '';
  double? _firstOperand;
  double? _secondOperand;

  String get display => _display;

  void input(String value) {
    if ('0123456789.'.contains(value)) {
      // Append number
      _display = _display == '0' ? value : _display + value;
    } else if ('+-*/'.contains(value)) {
      // Store first operand and operator
      _firstOperand = double.tryParse(_display);
      _operation = value;
      _display = '0';
    } else if (value == '=') {
      // Perform calculation
      _secondOperand = double.tryParse(_display);
      if (_firstOperand != null && _secondOperand != null) {
        switch (_operation) {
          case '+':
            _display = (_firstOperand! + _secondOperand!).toString();
            break;
          case '-':
            _display = (_firstOperand! - _secondOperand!).toString();
            break;
          case '*':
            _display = (_firstOperand! * _secondOperand!).toString();
            break;
          case '/':
            _display = _secondOperand! != 0
                ? (_firstOperand! / _secondOperand!).toString()
                : 'Error';
            break;
        }
      }
      _operation = '';
      _firstOperand = null;
      _secondOperand = null;
    } else if (value == 'C') {
      // Clear
      _display = '0';
      _operation = '';
      _firstOperand = null;
      _secondOperand = null;
    }
    notifyListeners();
  }
}
