import 'package:calculator/controller/calculator_controller.dart';
import 'package:calculator/extension.dart';
import 'package:calculator/widgets/icon_button.dart';
import 'package:calculator/widgets/text_button.dart';
import 'package:calculator/widgets/top_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PortraitView extends StatelessWidget{
  final CalculatorController? ct;
  const PortraitView({Key? key, @required this.ct}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children : [
          
           TopChip(lightMode: ct!.model.isLight, model: ct!.model),
              SizedBox(
                height: 10,
              ),
            
              Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.fromLTRB(0, 30, 30, 0),
                  child: Text(
                    ct!.model.mathExpression,
                    style: TextStyle(fontSize: 30, 
                    color: ct!.model.isLight ? HexColor.fromHex(ct!.model.dark[2]) : HexColor.fromHex(ct!.model.light[2])))),
              Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: Text(ct!.model.mathSolution.toString(),
                      style: TextStyle(
                          fontSize: 55, fontWeight: FontWeight.bold,
                          color: ct!.model.isLight ? HexColor.fromHex(ct!.model.dark[1]) : HexColor.fromHex(ct!.model.light[1])))),
                          SizedBox(
                height: 15,
              ),
            
             Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
              
              decoration: new BoxDecoration(
              color: ct!.model.isLight
                      ? HexColor.fromHex(ct!.model.light[1])
                      : HexColor.fromHex(ct!.model.dark[1]),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                topRight: const Radius.circular(30.0),
              )
            ),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ct!.model.list.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: (ct!.model.list[index] is IconData) 
                        ? MyIconButton(
                         lightMode: ct!.model.isLight,
                         model: ct!.model,
                         s: ct!.model.list[index],
                         onPress: (){
                           ct!.iconPress(ct!.model.list[index]);
                         },
                         ) 
                        : MyTextButton(lightMode: ct!.model.isLight, model: ct!.model, onPress: (){
                          print(ct!.model.list[index]);
                          ct!.press(ct!.model.list[index]);
                        }, s: ct!.model.list[index]),
                      );
                    },
                  ),
                ),
              )
              
        ]
      )
    );
  }
}