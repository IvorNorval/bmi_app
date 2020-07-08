import 'dart:math';

class BmiCalculator {
  BmiCalculator({this.height, this.wright});
  final int height;
  final int wright;
  double _bmi;

  String calcBMI() {
    _bmi = wright / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }
}
