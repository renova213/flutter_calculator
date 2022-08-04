import 'package:calculator/provider/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'calculator_button.dart';
import 'constants.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  get fontColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Consumer<CalculatorProvider>(
                    builder: (context, calculator, _) =>
                        calculator.results.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${calculator.stringNumber}${calculator.stringOperator}${calculator.stringNumber2}",
                                    style: TextStyle(
                                        color: fontColor,
                                        fontSize: headline3.sp),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    calculator.temporaryResults,
                                    style: TextStyle(
                                        color: fontColor,
                                        fontSize: headline5.sp),
                                  ),
                                ],
                              )
                            : Text(
                                calculator.results,
                                style: TextStyle(
                                    color: fontColor, fontSize: headline3.sp),
                              ),
                  ),
                ),
              ),
            ),
            Consumer<CalculatorProvider>(
              builder: (context, calculator, _) => GridView.count(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                crossAxisCount: 4,
                children: <Widget>[
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: 'C',
                    onTap: () {
                      calculator.clear();
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '+/-',
                    onTap: () {
                      if (calculator.stringOperator == "") {
                        calculator.inputOperator("+");
                      } else if (calculator.stringOperator == "+") {
                        calculator.inputOperator("-");
                      } else if (calculator.stringOperator == "-") {
                        calculator.inputOperator("+");
                      }
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '%',
                    onTap: () {
                      calculator.inputOperator("%");
                    },
                  ),
                  CalculatorButton.icon(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '',
                    icon: Icons.backspace,
                    onTap: () {
                      calculator.backSpace();
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '7',
                    onTap: () {
                      calculator.inputNumber("7");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '8',
                    onTap: () {
                      calculator.inputNumber("8");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '9',
                    onTap: () {
                      calculator.inputNumber("9");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: iconColor,
                    text: '/',
                    onTap: () {
                      calculator.inputOperator("/");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '4',
                    onTap: () {
                      calculator.inputNumber("4");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '5',
                    onTap: () {
                      calculator.inputNumber("5");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '6',
                    onTap: () {
                      calculator.inputNumber("6");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: iconColor,
                    text: 'x',
                    onTap: () {
                      calculator.inputOperator("*");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '1',
                    onTap: () {
                      calculator.inputNumber("1");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '2',
                    onTap: () {
                      calculator.inputNumber("2");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '3',
                    onTap: () {
                      calculator.inputNumber("3");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: iconColor,
                    text: '-',
                    onTap: () {
                      calculator.inputOperator("-");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '0',
                    onTap: () {
                      calculator.inputNumber("0");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '.',
                    onTap: () {
                      calculator.inputNumber(".");
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: fontColor,
                    text: '=',
                    onTap: () {
                      calculator.equals();
                    },
                  ),
                  CalculatorButton(
                    backgroundColor: buttonColor,
                    foregroundColor: iconColor,
                    text: '+',
                    onTap: () {
                      calculator.inputOperator("+");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
