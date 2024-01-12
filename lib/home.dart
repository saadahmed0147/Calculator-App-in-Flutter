import 'package:calculator/btn.dart';
import 'package:calculator/color.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: blackColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    color: darkGreyColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              userInput.toString(),
                              style: const TextStyle(
                                color: whiteColor,
                                fontSize: 100,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              answer.toString(),
                              style: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 70,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          color: lightGreyColor,
                          titleColor: blackColor,
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+/-',
                          color: lightGreyColor,
                          titleColor: blackColor,
                          onPress: () {
                            userInput = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '%',
                          color: lightGreyColor,
                          titleColor: blackColor,
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '÷',
                          color: orangeColor,
                          onPress: () {
                            userInput += '÷';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '8',
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '9',
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '×',
                          color: orangeColor,
                          onPress: () {
                            userInput += '×';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '5',
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '−',
                          color: orangeColor,
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '2',
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+',
                          color: orangeColor,
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton0(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '.',
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '=',
                          color: orangeColor,
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput.replaceAll('×', '*').replaceAll('÷', '/');
    finalUserInput = finalUserInput.replaceFirst(RegExp(r'\+\-|\-\+'), '-');
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    // answer = eval.toString();

    if (eval == eval.toInt()) {
      answer = eval.toInt().toString();
    } else {
      answer = eval.toStringAsFixed(2);
    }
  }
}
