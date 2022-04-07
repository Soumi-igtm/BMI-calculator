import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isElevated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        // child: GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       _isElevated = !_isElevated;
        //     });
        //   },
        //   child: Container(
        //     height: 200,
        //     width: 200,
        //     decoration: BoxDecoration(
        //       color: Colors.grey[300],
        //       borderRadius: BorderRadius.circular(50),
        //       boxShadow: _isElevated
        //           ? [
        //               BoxShadow(
        //                 color: Colors.redAccent[500]!,
        //                 offset: const Offset(4, 4),
        //                 blurRadius: 15,
        //                 spreadRadius: 1,
        //               ),
        //               const BoxShadow(
        //                 color: Colors.redAccent,
        //                 offset: Offset(-4, -4),
        //                 blurRadius: 15,
        //                 spreadRadius: 1,
        //               ),
        //             ]
        //           : null,
        //     ),
        //   ),
        // ),
        child: buildAlpha(context),
      ),
    );
  }

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        ("Already contains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    (_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return InkWell(
      onTap: () => buttonPressed(buttonText),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
          // padding: const EdgeInsets.all(8.0),
          width: 70,
          height: 70,
          decoration: BoxDecoration(            
            // color: Colors.grey[200],
            // borderRadius: BorderRadius.circular(15),
            // boxShadow: [
            //   BoxShadow(
            //     offset: Offset(-2, -2),
            //     color: Colors.white,
            //     spreadRadius: 2,
            //     blurRadius: 12
            //   ),
            //   BoxShadow(
            //     offset: Offset(2, 2),
            //     color: Colors.grey[500]!,
            //     spreadRadius: 2,
            //     blurRadius: 12
            //   ),
            // ]
          ),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),          
      )
    );
  }

  Widget buildAlpha(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 12.0),
                child: Text(output,
                    style: const TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ))),
            const Expanded(
              child: Divider(),
            ),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("X")
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+")
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton("CLEAR"),
                  buildButton("="),
              ])
            ])
          ],
        ));
  }
}
