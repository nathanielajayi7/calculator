import 'package:calculator/screens/calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:function_tree/function_tree.dart' as expression;

class CalculatorModel {
  CalculatorState? state;

  bool isLight = true;

  String mathExpression = '';
  String display = '';
  bool negation = false;
  
  List<dynamic> list = [
    {
      'name' :'AC',
      'color' : Color(0xff35d5b7) 
    },
    {
      'name' :'+/-',
      'color' : Color(0xff35d5b7) 
    },
    {
      'name' :'%',
      'color' : Color(0xff35d5b7) 
    },
    {
      'name' : '÷',
      'color' : Color(0xffe96668) 
    },
    '7',
    '8', 
    '9',
    {
      'name' :'x',
      'color' : Color(0xffe96668) 
    }, 
    '6', 
    '5', 
    '4', 
    {
      'name' :'-',
      'color' : Color(0xffe96668) 
    },
    '1',
    '2',
    '3',
    {
      'name' :'+',
      'color' : Color(0xffe96668) 
    },
    CupertinoIcons.restart,
    '0',
    '.',
    {
      'name' :'=',
      'color' : Color(0xffe96668) 
    },
    ]; 
  get mathSolution {
    String s = mathExpression;
    s = s.replaceAll("x", " * ");
    s = s.replaceAll("%", "/ 100");
    s = s.replaceAll("÷" , "/");
    try {
      num d = s.interpret();
      double f = d.toDouble();
      return (f % 1 == 0) ? d.toInt() : d;
    } catch (e) {
      return '';
    }
  }

  set mathExp(String s) {
    mathExpression = s;
  }

  set addMathExp(String s) {
    if(negation){
      
    mathExpression += ("" + s + ")");
    negation = false;

    return;

    }
    mathExpression += (" " + s);
  }

  List dark = ['#121212', '#222222', '#202020'];
  List light = ['#ffffff', '#f9f9f9', '#f5f5f5'];

  set setState(CalculatorState st) {
    state = st;
 
  }

  String newString(int n) {
  if (mathExpression.length >= n) {
    return mathExpression.substring(mathExpression.length - n);
  } else {
    return '';
    // return whatever you want
  }
}
}
