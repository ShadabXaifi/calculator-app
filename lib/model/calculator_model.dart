class CalculatorModel {
  double num1 = 0;
  double num2 = 0;
  String operand = '';
  String output = '0';

  String calculate(String btnText) {
    if (btnText == "AC") {
      output = '0';
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/') {
      num1 = double.tryParse(output) ?? 0;
      operand = btnText;
      output = '0';
    } else if (btnText == '=') {
      num2 = double.tryParse(output) ?? 0;

      switch (operand) {
        case '+':
          output = (num1 + num2).toString();
          break;
        case '-':
          output = (num1 - num2).toString();
          break;
        case 'x':
          output = (num1 * num2).toString();
          break;
        case '/':
          output = num2 != 0 ? (num1 / num2).toString() : 'ERROR';
          break;
      }

      num1 = 0;
      num2 = 0;
      operand = '';
    } else if (btnText == '.') {
      if (!output.contains('.')) {
        output += '.';
      }
    } else if (btnText == "+/-") {
      if (output != "0") {
        output = output.startsWith("-") ? output.substring(1) : "-$output";
      }
    } else if (btnText == "%") {
      double current = double.tryParse(output) ?? 0;
      output = (current / 100).toString();
    } else {
      output = output == '0' ? btnText : output + btnText;
    }

    return output;
  }
}
