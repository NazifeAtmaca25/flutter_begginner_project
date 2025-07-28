import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final List<String> _items = [
    "C",
    "%",
    "/",
    "⌫",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "+/-",
    "0",
    ".",
    "="
  ];

  String userInput = '';
  String result = '';

  String calculate(String input) {
    Parser p = Parser();
    Expression exp = p.parse(input.replaceAll('x', '*'));
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    return eval.toString();
  }

  void operations(String value) {
    setState(() {
      if (value == 'C') {
        userInput = '';
        result = '';
      } else if (value == '⌫') {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
        }
      } else if (value == '=') {
        try {
          result = calculate(userInput);
        } catch (e) {
          result = "Hata";
        }
      } else if (value == "%") {
        if (userInput.isNotEmpty) {
          try {
            double current = double.parse(userInput);
            userInput = (current / 100).toString();
          } catch (e) {
            result = "Hata";
          }
        }
      } else if (value == '+/-') {
        if (userInput.isNotEmpty) {
          userInput = userInput.startsWith('-')
              ? userInput.substring(1)
              : '-$userInput';
        }
      } else if (value == '.') {
        if (!userInput.contains('.')) {
          userInput += '.';
        }
      } else {
        userInput += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hesap Makinesi"),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        userInput,
                        style: TextStyle(fontSize: 30, color: Colors.black87),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        result,
                        style: TextStyle(
                            fontSize: 36,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => operations(_items[index]),
                      child: Container(
                        margin: EdgeInsets.all(4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          _items[index],
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
