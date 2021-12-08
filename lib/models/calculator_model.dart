import 'package:calculator/screens/calculator.dart';

class CalculatorModel{

  CalculatorState? state;
  
  bool isLight = true;

  List dark = ['#22252d', '#292d36', '#272b33'];
  List light = ['#ffffff', '#f9f9f9', '#f7f7f7'];
  set setState(CalculatorState st){

    state = st;

  }
  

}