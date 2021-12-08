// ignore_for_file: invalid_use_of_protected_member

import 'package:calculator/models/calculator_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorController extends ControllerMVC{

  final CalculatorModel model = CalculatorModel();

  void press(dynamic s){
    print(s);
    if(s is String){
      parse(s);
    }
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
    if(model.mathExpression.isEmpty){
      return;
    }
    switch(data.codePoint) {
     case 63009 : {
       model.state!.setState(() {

        model.mathExpression = model.mathExpression.substring(0, model.mathExpression.length - 1);
          
        });
        break;
     }
    }
  }
  parse(String s){
    switch(s){
      case 'AC' : {
        model.state!.setState(() {

        model.mathExpression = '';
          
        });
        break;

      }
      default: {
        model.state!.setState(() {

        model.addMathExp = s;
          
        });
        break;
      }
    }
  }
}