import 'package:flutter/cupertino.dart';

class CalculatorProvider extends ChangeNotifier {
  String stringNumber = "0";
  String stringNumber2 = "";
  String stringOperator = "";
  String results = "";
  String temporaryResults = "";

  void clear() {
    stringNumber = "0";
    stringNumber2 = "";
    stringOperator = "";
    temporaryResults = "";
    results = "";
    notifyListeners();
  }

  void backSpace() {
    if (stringNumber == '0' || stringNumber == '' || stringNumber.length == 1) {
      stringNumber = '0';
      stringNumber2 = "";
      stringOperator = "";
    } else if (stringNumber.isNotEmpty &&
        stringOperator.isNotEmpty &&
        stringNumber2.isNotEmpty) {
      stringNumber2 = stringNumber2.substring(0, stringNumber2.length - 1);
    } else if (stringNumber.isNotEmpty &&
        stringNumber2.isEmpty &&
        stringOperator.isNotEmpty) {
      stringOperator = stringOperator.substring(0, stringOperator.length - 1);
    } else {
      stringNumber = stringNumber.substring(0, stringNumber.length - 1);
    }

    if (stringNumber.isNotEmpty && stringNumber2.isEmpty) {
      temporaryResults = "";
    } else {
      temporaryResult();
    }
    notifyListeners();
  }

  void inputNumber(String number) {
    if (results.isNotEmpty) {
      clear();
    }

    if (stringNumber2.isEmpty &&
        stringNumber == "0" &&
        stringOperator.isEmpty) {
      stringNumber = "";
      stringNumber += number;
    } else if (stringNumber2.isEmpty && stringOperator.isEmpty) {
      stringNumber += number;
    } else {
      stringNumber2 += number;
    }

    if (stringNumber.isNotEmpty && stringNumber2.isNotEmpty) {
      temporaryResult();
    }

    notifyListeners();
  }

  void inputNumber2(String number) {
    stringNumber2 += number;
    notifyListeners();
  }

  void inputOperator(String operator) {
    if (stringOperator.isEmpty || stringOperator.length == 1) {
      if (operator == "+") {
        stringOperator = "+";
      } else if (operator == "-") {
        stringOperator = "-";
      } else if (operator == "/") {
        stringOperator = "/";
      } else {
        stringOperator = "*";
      }
    }
    if (stringNumber.isNotEmpty &&
        stringNumber2.isNotEmpty &&
        stringOperator.length == 1) {
      temporaryResult();
    }
    notifyListeners();
  }

  void temporaryResult() {
    if (stringNumber.contains(".") || stringNumber2.contains(".")) {
      double doubleParseStringNumber = double.parse(stringNumber);
      double doubleParseStringNumber2 = double.parse(stringNumber2);
      if (stringOperator == "+") {
        double result = doubleParseStringNumber + doubleParseStringNumber2;
        temporaryResults = result.toString();
      } else if (stringOperator == "-") {
        double result = doubleParseStringNumber - doubleParseStringNumber2;
        temporaryResults = result.toString();
      } else if (stringOperator == "/") {
        double result = doubleParseStringNumber / doubleParseStringNumber2;
        temporaryResults = result.toString();
      } else {
        double result = doubleParseStringNumber * doubleParseStringNumber2;
        temporaryResults = result.toString();
      }
    } else {
      int intParseStringNumber = int.parse(stringNumber);
      int intParseStringNumber2 = int.parse(stringNumber2);
      if (stringOperator == "+") {
        int result = intParseStringNumber + intParseStringNumber2;
        temporaryResults = result.toString();
      } else if (stringOperator == "-") {
        int result = intParseStringNumber - intParseStringNumber2;
        temporaryResults = result.toString();
      } else if (stringOperator == "/") {
        double result =
            intParseStringNumber.toDouble() / intParseStringNumber2.toDouble();
        if (result % 2 == 0 || result % 1 == 0) {
          temporaryResults = result.round().toString();
        } else {
          temporaryResults = result.toString();
        }
      } else {
        int result = intParseStringNumber * intParseStringNumber2;
        temporaryResults = result.toString();
      }
    }
  }

  void equals() {
    results = temporaryResults;
    notifyListeners();
  }
}
