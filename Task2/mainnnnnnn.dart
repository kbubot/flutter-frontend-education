import 'package:flutter/material.dart';
import 'package:untitled6/ewffw.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '계산기',
        home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //여기였음ㅋ
  String equation = '0';
  String result = '0';
  String expression = '0';

  void buttonPressed(String btnVal) {
    print(btnVal);
    setState(() {
      if (btnVal == 'C') {
        equation = '0';
        result = '0';
      } else if (btnVal == '=') {
        expression = equation;
        expression = expression.replaceAll('*', '*');
        expression = expression.replaceAll('/', '/');

        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'error';
        }
      } else {
        if (equation == '0') {
          equation = btnVal;
        } else {
          equation = equation + btnVal;
        }
      }
    });
  }



  @override //여기가 선
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('task 2'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
              fit: FlexFit.tight,
              child:ListView (


                  children:[
              Container(
                child: Text(equation,style: TextStyle(fontSize: 20),),
                alignment: Alignment(1.0,1.0),
              ),]),
          ),

          Flexible(
              fit: FlexFit.tight,
              child: Container(
                child: Text(result,style: TextStyle(fontSize: 40),),
                alignment: Alignment(1.0,1.0),
              )
          ),
          Flexible(
            flex: 4,
            child: Row(


              children: [

                Flexible(
                  flex: 3,
                  child:Column(
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      Flexible(
                          fit: FlexFit.tight,

                          child:Row(
                          children: [
                          buildButton(
                            aText: '7',
                            w:100,
                            h:80,
                            callback: buttonPressed,
                          ),
                            buildButton(
                              aText: '8',
                              w:100,
                              h:80,
                              callback: buttonPressed,
                            ),
                            buildButton(
                              aText: '9',
                              w:100,
                              h:80,
                              callback: buttonPressed,
                            ),
                       ],
                      )),
                      Flexible(
                          fit: FlexFit.tight,

                          child:Row(
                            children: [
                              buildButton(
                                aText: '4',
                                w:100,
                                h:80,
                                callback: buttonPressed,
                              ),
                              buildButton(
                                aText: '5',
                                w:100,
                                h:80,
                                callback: buttonPressed,
                              ),
                              buildButton(
                                aText: '6',
                                w:100,
                                h:80,
                                callback: buttonPressed,
                              ),
                            ],
                          )),
                      Flexible(
                          fit: FlexFit.tight,

                          child:Row(
                            children: [
                              buildButton(
                                aText: '1',
                                w:100,
                                h:80,
                                callback: buttonPressed,
                              ),
                              buildButton(
                                aText: '2',
                                w:100,
                                h:80,
                                callback: buttonPressed,
                              ),
                              buildButton(
                                aText: '3',
                                w:100,
                                h:80,
                                callback: buttonPressed,
                              ),
                            ],
                          )),
                      Flexible(
                          fit: FlexFit.tight,

                          child:Row(
                            children: [
                              buildButton(
                                aText: '0',
                                w:200,
                                h:80,
                                callback: buttonPressed,
                              ),
                              buildButton(
                                aText: '=',
                                w:100,
                                h:80,
                                callback: buttonPressed,
                              ),
                            ],
                          )
                      )
                    ],
                  )



                ),


              Flexible(
                  flex:1,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                        buildButton(
                        aText: 'C',
                        w:100,
                        h:80,
                        callback: buttonPressed,
                      ),
                      buildButton(
                        aText: '+',
                        w:100,
                        h:80,
                        callback: buttonPressed,
                      ),
                      buildButton(
                      aText: '-',
                      w:100,
                      h:80,
                      callback: buttonPressed,
                       ),
                          buildButton(
                            aText: '*',
                            w:100,
                            h:80,
                            callback: buttonPressed,
                          ),
                          buildButton(
                            aText: '/',
                            w:100,
                            h:80,
                            callback: buttonPressed,
                          ),

                        ],
                      ),
                    ],
                  )
              )

              ],
            ),
          ),
        ],
      ),
    );
  }
}