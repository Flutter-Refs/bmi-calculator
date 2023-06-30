import 'dart:math';

class Calculator {
  final int weight;
  final int height;
  late double _bmi;

  Calculator({
    required this.weight,
    required this.height,
  });

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResult(){
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 15.5){
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 15.5){
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
