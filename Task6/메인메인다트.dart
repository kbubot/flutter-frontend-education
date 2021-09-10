import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (_) => Counter(0),
      child: MaterialApp(
        title: '과제',
        home: MyHomePage(),
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  int counter;

  Counter(this.counter);

  getCounter() => counter;

  setCounter(int counter) => counter;

  void add() {
    counter++;
    notifyListeners();
  }

  void remove() {
    counter--;
    notifyListeners();
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          'Flutter Tutorial',
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 170, 0, 0),
              child: Container(
                child: Text(
                  '${counter.getCounter()}',
                  style: TextStyle(fontSize: 60),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Row(
                children: [
                  ButtonTheme(
                    minWidth: 90,
                    height: 40,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                      child: RaisedButton(
                        child: Text(
                          '-',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.red,
                        onPressed: () {
                          counter.remove();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ButtonTheme(
                    minWidth: 90,
                    height: 40,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                      child: RaisedButton(
                        child: Text(
                          '+',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          counter.add();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            ButtonTheme(
              minWidth: 200,
              height: 47,
              child: RaisedButton(
                child: Text(
                  '페이지 이동',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                color: Colors.orangeAccent,
                onPressed: GoNextPage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future GoNextPage() {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NextPage()),
    );
  }
}

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
          child: Text(
            'Flutter Tutorial',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Text(
            'Num:${counter.getCounter()}',
            style: TextStyle(color: Colors.black, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
