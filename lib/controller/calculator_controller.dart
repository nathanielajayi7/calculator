import 'package:calculator/models/calculator_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorController extends ControllerMVC{

  final CalculatorModel model = CalculatorModel();

  Future<bool> isLightTheme() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(!pref.containsKey("theme")){
      pref.setString("theme", "light");
      return true;
    }
    return pref.getString("theme") == "dark";
  }
  
}