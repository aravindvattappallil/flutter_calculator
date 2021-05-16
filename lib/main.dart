import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/basic.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  operation(String btn) {
    if (btn == "c") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (btn == "+" || btn == "-" || btn == "x" || btn == "/") {
      num1 = double.parse(output);
      operand = btn;
      _output = "0";
    } else if (btn == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + btn;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(1);
    });
  }

  Widget button(String btn) {
    return Expanded(
      child: RawMaterialButton(
        shape: Border.all(color: Colors.black, width: 5),
        onPressed: () {
          operation(btn);
        },
        child: Text(
          "$btn",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        padding: EdgeInsets.all(30),
        splashColor: Colors.lightGreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5)),
                child: Text(
                  "$output",
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              )),
              Row(children: [
                button("7"),
                button("8"),
                button("9"),
                button("/"),
              ]),
              Row(children: [
                button("4"),
                button("5"),
                button("6"),
                button("x"),
              ]),
              Row(children: [
                button("1"),
                button("2"),
                button("3"),
                button("+"),
              ]),
              Row(children: [
                button("0"),
                button("c"),
                button("="),
                button("-"),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
