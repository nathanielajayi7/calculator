import 'package:calculator/extension.dart';
import 'package:calculator/models/calculator_model.dart';
import 'package:calculator/widgets/icon_button.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final bool? lightMode;
  final Function()? onPress; 
  final CalculatorModel? model;
  final dynamic s;
  const MyTextButton({Key? key, @required this.lightMode, @required this.model, @required this.onPress, @required this.s}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    if(!(s is String)){
      if(s!['icon'] != null){
        return MyIconButton(lightMode: lightMode, model: model, onPress: onPress, s: s);
      }
    }
    return Container(
       // width: double.infinity,
       decoration: BoxDecoration(
            border: Border.all(width: 0, color: Colors.transparent),
            color: lightMode! ? HexColor.fromHex(model!.light[2]) : HexColor.fromHex(model!.dark[2]),
           // shape: BoxShape.circle,
           borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                color: lightMode! ? HexColor.fromHex(model!.light[1]) : HexColor.fromHex(model!.dark[1]),
                offset: Offset(0, 0),
                blurRadius: 1,
              )
            ]),
        margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: lightMode! ? HexColor.fromHex(model!.light[2]) : HexColor.fromHex(model!.dark[2]),
            shadowColor: lightMode! ? HexColor.fromHex(model!.light[1]) : HexColor.fromHex(model!.dark[1]),
           
            child: InkWell(
              
              borderRadius: BorderRadius.all(Radius.circular(25)),
              onTap: (){

                onPress!.call();

              },
              child: Container(
         // width: 125,
         // padding: EdgeInsets.all(4),
          
            alignment: Alignment.center,
            child: (s is String) ? Text( s!,
              style: TextStyle(
              fontSize: 20,
              color: lightMode! ? Colors.black : Colors.white
            ))
            :
            Text( s!['name'],
              style: TextStyle(
              fontSize: 24,
              color: s['color']
            ))
            ))
    ));
  }
}
