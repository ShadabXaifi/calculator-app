import 'package:flutter/material.dart';
import '../controller/calculator_controller.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final CalculatorController controller = CalculatorController();
  String displayText = '0';

  void handleButtonPress(String value) {
    setState(() {
      displayText = controller.onButtonPressed(value);
    });
  }

  Widget calcButton(String text, Color bgColor, Color txtColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () => handleButtonPress(text),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: bgColor,
            padding: const EdgeInsets.all(20),
          ),
          child: Text(text, style: TextStyle(fontSize: 28, color: txtColor)),
        ),
      ),
    );
  }

  Widget zeroButton() {
    return Expanded(
      flex: 2,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () => handleButtonPress('0'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[850],
            padding: const EdgeInsets.symmetric(vertical: 20),
            shape: const StadiumBorder(),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Text('0', style: TextStyle(fontSize: 28, color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(displayText, style: const TextStyle(color: Colors.white, fontSize: 80)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(children: [
              calcButton('AC', Colors.grey, Colors.black),
              calcButton('+/-', Colors.grey, Colors.black),
              calcButton('%', Colors.grey, Colors.black),
              calcButton('/', Colors.amber, Colors.white),
            ]),
            Row(children: [
              calcButton('7', Colors.grey[850]!, Colors.white),
              calcButton('8', Colors.grey[850]!, Colors.white),
              calcButton('9', Colors.grey[850]!, Colors.white),
              calcButton('x', Colors.amber, Colors.white),
            ]),
            Row(children: [
              calcButton('4', Colors.grey[850]!, Colors.white),
              calcButton('5', Colors.grey[850]!, Colors.white),
              calcButton('6', Colors.grey[850]!, Colors.white),
              calcButton('-', Colors.amber, Colors.white),
            ]),
            Row(children: [
              calcButton('1', Colors.grey[850]!, Colors.white),
              calcButton('2', Colors.grey[850]!, Colors.white),
              calcButton('3', Colors.grey[850]!, Colors.white),
              calcButton('+', Colors.amber, Colors.white),
            ]),
            Row(children: [
              zeroButton(),
              calcButton('.', Colors.grey[850]!, Colors.white),
              calcButton('=', Colors.amber, Colors.white),
            ]),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
