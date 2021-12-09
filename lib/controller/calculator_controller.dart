// ignore_for_file: invalid_use_of_protected_member

import 'package:calculator/models/calculator_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorController extends ControllerMVC{

  final CalculatorModel model = CalculatorModel();

  void press(dynamic s){
    print(s);
      parse((s is String) ? s : s['name']);
    
  }

  void iconPress(dynamic s){
    print(s);
    if(s is IconData){
      parseIcon(s);
    }
  }
  Future<bool> isLightTheme() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(!pref.containsKey("theme")){
      pref.setString("theme", "light");
      return true;
    }
    return pref.getString("theme") == "light";
  }

  parseIcon(IconData data){
    print(data.codePoint);
    
    switch(data.codePoint) {
     case 61980 : {
       if(model.mathExpression.isEmpty){
      return;
    }
       model.state!.setState(() {

        model.mathExpression = model.mathExpression.substring(0, model.mathExpression.length - 1);
        
          model.negation = (model.mathExpression.contains("(-") && !model.mathExpression.contains(")"));
        
          
        });
        break;
     }
    }
  }
  parse(dynamic s){
    switch(s){
      case 'AC' : {
        model.state!.setState(() {

        model.display = '';
        model.mathExpression = '';
          
        });
        break;

      }
      case '=' : {
        if(model.display.isNotEmpty){
          return;
        }
        model.state!.setState(() {
        
        model.display = model.mathSolution.toString();
        model.mathExpression = '';
          
        });
        break;

      }
      case '+/-' : {
        if(model.display.isNotEmpty){
          return;
        }
        model.state!.setState(() {
        
        model.display = '';
        model.mathExpression +=  ' (-';
        model.negation = true;

        });
        break;

      }
      default: {
        model.state!.setState(() {

        model.display = '';

        model.addMathExp = (s is String) ? s : s['name'];
          
        });
        break;
      }
    }
  }
}