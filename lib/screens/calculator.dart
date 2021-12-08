import 'package:calculator/controller/calculator_controller.dart';
import 'package:calculator/extension.dart';
import 'package:calculator/screens/portrait.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Calculator> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  CalculatorController ct = CalculatorController();

  setTheme() async {
    ct.model.isLight = await ct.isLightTheme().then((value){
      setState(() {
        
      });
      return value;
    });

    
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    setTheme();
    ct.model.setState = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    setTheme();
    // ignore: unused_local_variable
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: ct.model.isLight
          ? HexColor.fromHex(ct.model.light[0])
          : HexColor.fromHex(ct.model.dark[0]),
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: ct.model.isLight
            ? HexColor.fromHex(ct.model.light[0])
            : HexColor.fromHex(ct.model.dark[0]),
        title: Text(widget.title),
      ),
      body: Container(
        child: PortraitView(ct: ct)
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


/*
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            if(orientation != Orientation.portrait) Row(

                
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
                
              children: 
              [
              TopChip(lightMode: ct.model.isLight, model: ct.model),
              
              if(orientation != Orientation.portrait)
              Expanded(child: Container()),
              Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.fromLTRB(0, 30, 30, 0),
                  child: Text(
                    ct.model.mathExpression,
                    style: TextStyle(fontSize: 30, color: Colors.grey[600]),
                  )),
              
              Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.fromLTRB(0, (orientation != Orientation.portrait) ? 10 : 0, 30, 0),
                  child: Text(ct.model.mathSolution.toString(),
                      style: TextStyle(
                          fontSize: 55, fontWeight: FontWeight.bold))),
                          
             if(orientation != Orientation.portrait) Expanded(
               flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8),
             // height: MediaQuery.of(context).size.height,
              decoration: new BoxDecoration(
              color: ct.model.isLight
                      ? HexColor.fromHex(ct.model.light[1])
                      : HexColor.fromHex(ct.model.dark[1]),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                bottomLeft: const Radius.circular(30.0),
              )
            ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ct.model.list.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (orientation == Orientation.portrait) ? 4 : 5),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: (ct.model.list[index] is IconData) 
                        ? MyIconButton(
                         lightMode: ct.model.isLight,
                         model: ct.model,
                         s: ct.model.list[index],
                         onPress: (){

                         },
                         ) 
                        : MyTextButton(lightMode: ct.model.isLight, model: ct.model, onPress: (){

                        }, s: ct.model.list[index]),
                      );
                    },
                  ),
                ),
              )
            ]),


          
            ]),
 */