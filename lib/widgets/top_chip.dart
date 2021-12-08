// ignore_for_file: invalid_use_of_protected_member

import 'package:calculator/extension.dart';
import 'package:calculator/models/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopChip extends StatelessWidget {
  final bool? lightMode;
  final CalculatorModel? model; 
  const TopChip({Key? key, @required this.lightMode, @required this.model}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
       // width: double.infinity,
        padding: EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Container(
          width: 125,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(width: 0, color: Colors.transparent),
            color: lightMode! ? HexColor.fromHex(model!.light[2]) : HexColor.fromHex(model!.dark[2]),
           // shape: BoxShape.circle,
           borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                color: lightMode! ? HexColor.fromHex(model!.light[1]) : HexColor.fromHex(model!.dark[1]),
                offset: Offset(0, 0),
                blurRadius: 1,
              )
            ]),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () async {

                  SharedPreferences.getInstance().then((value){

                    value.setString("theme", "light");
                    model!.state!.setState(() {

                      
                      print(lightMode!);
                      
                    });
                  });


                }, icon: Icon(Icons.light_mode_outlined,
                color: lightMode! ? Colors.grey[700] : Colors.grey[400],)),
                IconButton(onPressed: () async {
                  SharedPreferences.getInstance().then((value){

                    value.setString("theme", "dark");
                    model!.state!.setState(() {

                      print(lightMode!);
                      
                    });
                  });
                }, icon: Icon(Icons.dark_mode_outlined,
                color: lightMode! ? Colors.grey[400] : Colors.white))
              ],
            )));
  }
}
