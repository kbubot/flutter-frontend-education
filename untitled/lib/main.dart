import 'package:flutter/material.dart';
import 'package:untitled/widget/Button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MaterialApp(
      home: MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String equation = '0';
  String result = '0';
  String expression = '0';

  void btnOnClick(String btnVal) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: AppBar(
            title: Text(
              'Second Task',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 12, 100),
                              child: Text(
                                equation,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            alignment: Alignment(1.0, 1.0),
                          ),
                        ],
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            result,
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        alignment: Alignment(1.0, 1.0),
                      ),
                    ],
                  ),

            ),
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                            child: Row(
                          children: [
                            Flexible(
                              child: Button(
                                text: '7',
                                w: 120,
                                h: 100,
                                callback: btnOnClick,
                              ),
                            ),
                            Flexible(
                                child: Button(
                              text: '8',
                              w: 120,
                              h: 100,
                              callback: btnOnClick,
                            )),
                            Flexible(
                                child: Button(
                              text: '9',
                              w: 120,
                              h: 100,
                              callback: btnOnClick,
                            )),
                          ],
                        )),
                        Flexible(
                            child: Row(
                          children: [
                            Flexible(
                                child: Button(
                              text: '4',
                              w: 120,
                              h: 100,
                              callback: btnOnClick,
                            )),
                            Flexible(
                                child: Button(
                              text: '5',
                              w: 120,
                              h: 100,
                              callback: btnOnClick,
                            )),
                            Flexible(
                                child: Button(
                              text: '6',
                              w: 120,
                              h: 100,
                              callback: btnOnClick,
                            )),
                          ],
                        )),
                        Flexible(
                            child: Row(
                          children: [
                            Flexible(
                              child: Button(
                                text: '1',
                                w: 120,
                                h: 100,
                                callback: btnOnClick,
                              ),
                            ),
                            Flexible(
                                child: Button(
                              text: '2',
                              w: 120,
                              h: 100,
                              callback: btnOnClick,
                            )),
                            Flexible(
                                child: Button(
                              text: '3',
                              w: 120,
                              h: 100,
                              callback: btnOnClick,
                            )),
                          ],
                        )),
                        Flexible(
                            child: Row(
                          children: [
                            Flexible(
                              child: Button(
                                text: '0',
                                w: 210,
                                h: 100,
                                callback: btnOnClick,
                              ),
                              flex: 2,
                            ),
                            Flexible(
                              child: Button(
                                text: '=',
                                w: 120,
                                h: 100,
                                callback: btnOnClick,
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                    flex: 3,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                            child: Button(
                          text: 'C',
                          w: 70,
                          h: 90,
                          callback: btnOnClick,
                        )),
                        Flexible(
                            child: Button(
                          text: '+',
                          w: 70,
                          h: 90,
                          callback: btnOnClick,
                        )),
                        Flexible(
                            child: Button(
                          text: '-',
                          w: 70,
                          h: 90,
                          callback: btnOnClick,
                        )),
                        Flexible(
                            child: Button(
                          text: '*',
                          w: 70,
                          h: 90,
                          callback: btnOnClick,
                        )),
                        Flexible(
                            child: Button(
                          text: '/',
                          w: 70,
                          h: 90,
                          callback: btnOnClick,
                        )),
                      ],
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
