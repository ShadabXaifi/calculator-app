import '../model/calculator_model.dart';

class CalculatorController {
  final CalculatorModel _model = CalculatorModel();

  String onButtonPressed(String buttonText) {
    return _model.calculate(buttonText);
  }
}
