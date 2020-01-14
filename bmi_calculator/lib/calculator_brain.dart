

import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;

  double _bmi;

  CalculatorBrain({this.height, this.weight });

  String calculateBmi() {
    this._bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (this._bmi >= 25) {
      return 'Overweight';
    } else if (this._bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (this._bmi >= 25) {
      return 'too fat';
    } else if (this._bmi > 18.5) {
      return 'random';
    } else {
      return 'too skinny';
    }
  }
}