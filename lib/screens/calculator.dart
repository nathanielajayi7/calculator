import 'package:calculator/controller/calculator_controller.dart';
import 'package:calculator/extension.dart';
import 'package:calculator/widgets/top_chip.dart';
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
    ct.model.isLight = await ct.isLightTheme();
    print(ct.model.isLight);
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
        child:
            Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              TopChip(
                lightMode: ct.model.isLight,
                model: ct.model
              )
            ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
