import 'package:calculator/screens/calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:function_tree/function_tree.dart' as expression;

class CalculatorModel {
  CalculatorState? state;

  bool isLight = true;

  String mathExpression = '';
  List<dynamic> list = ['AC', '(', ')', '/', '7', '8', '9', 'x', '6', '5', '4', '-',
  '1', '2', '3', '+', '%', '0', '.', CupertinoIcons.delete_left]; 
  get mathSolution {
    String s = mathExpression;
    s = s.replaceAll("x", " * ");
    s = s.replaceAll("%", "/ 100");
    try {
      return s.interpret();
    } catch (e) {
      return '';
    }
  }

  set mathExp(String s) {
    mathExpression = s;
  }

  set addMathExp(String s) {
    mathExpression += (" " + s);
  }

  List dark = ['#22252d', '#292d36', '#272b33'];
  List light = ['#ffffff', '#f9f9f9', '#f7f7f7'];

  set setState(CalculatorState st) {
    state = st;
  }
}
