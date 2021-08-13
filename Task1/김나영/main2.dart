import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class FirstMyPage extends StatefulWidget {
  const FirstMyPage({ Key? key }) : super(key: key);
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstMyPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyApp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('splash screen',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: Colors.black),
                )

              ],
            ),
        ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }
  void decreaseCounter() {
    setState(() {
      counter--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Tutorial"),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                "$counter",
                style: TextStyle(fontSize: 160.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      "-",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                    onPressed: () {
                      decreaseCounter();
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      "+",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      increaseCounter();
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