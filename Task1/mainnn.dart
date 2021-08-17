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

        body: Center(child:Text("splash screen",
      style: TextStyle(
        fontSize:40.0,
        fontWeight: FontWeight.bold,
      )

      ),)

    );
  }
}

class Counter extends StatefulWidget {
  const Counter({ Key? key }) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count=0; //유아이에 표시될 그거
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
          title: Text("Flutter Tutorial"),centerTitle: true,
        ),
        body: Center(
          

          child: Column(
            // 세로로 위젯을 배치
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "$count",
                style: TextStyle(fontSize: 100.0),
              ),
              Row(
                // 가로로 위젯을 배치, 안에 버튼 2개가 들어가 있음.
                mainAxisAlignment:
                MainAxisAlignment.center, // 중간으로 슉슉
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

