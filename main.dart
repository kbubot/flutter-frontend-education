import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: FirstPage(),));


class FirstPage extends StatefulWidget {
  const FirstPage({ Key? key }) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Counter()));
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("splash screen",
      style: TextStyle(
        fontSize:40.0,
        fontWeight: FontWeight.bold,
      )

      )

    );
  }
}

class Counter extends StatefulWidget {
  const Counter({ Key? key }) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count=0; //유아이에 표시될
  void increase(){

    setState(() {
      count++;
    });
  }

  void decrease(){

    setState(() {
      count--;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "첫 플러터 앱",
      home: Scaffold(
        appBar: AppBar(
          title: Text("                           Flutter Tutorial"),
        ),
        body: Container(
          padding: const EdgeInsets.all(100.0), // 전체적으로 100씩 패딩을 주었음.

          child: Column(
            // 세로로 위젯을 배치
            children: <Widget>[
              Text(
                "$count",
                style: TextStyle(fontSize: 100.0),
              ),
              Row(
                // 가로로 위젯을 배치, 안에 버튼 2개가 들어가 있음.
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // 위젯끼리 같은 공간만큼 띄움
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      "-",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue, // 버튼 색은 파란색으로
                    onPressed: () {
                      // 버튼을 누르면 안에 있는 함수를 실행
                      decrease();
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      "+",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red, // 버튼 색은 빨간색으로
                    onPressed: () {
                      // 버튼을 누르면 안에 있는 함수를 실행
                      increase();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

