import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (_) => Counter(0),
      child: MaterialApp(
        title: 'Flutter Value',
        home: AppPage(),
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _counter;

  Counter(this._counter);

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void plussign() {
    _counter++;
    notifyListeners();
  }

  void minussign() {
    _counter--;
    notifyListeners();
  }
}

class AppPage extends StatefulWidget {
  @override
  AppPageState createState() => AppPageState();
}


class SimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<int>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Flutter Tutorial',
          style: TextStyle(color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('${data}',
          style: TextStyle(color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

class AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Flutter Tutorial",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding : EdgeInsets.only(top: 200),
              child: Container(
              child : Text(
                '${counter.getCounter()}',
                style: TextStyle(
                    fontSize: 50
                ),
              ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonTheme(
                    minWidth: 120.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text('-',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      color: Colors.red,
                      onPressed: () {
                        counter.minussign();
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 120.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text('+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        counter.plussign();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                children: [
                  ButtonTheme(
                    minWidth: 260.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text('페이지이동',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      ),
                      color: Colors.orange,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>FirstPage()),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future openFirstPage() {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FirstPage()),
    );
  }
}
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Flutter Tutorial',
        style: TextStyle(color: Colors.black,
        ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text('Num : ${counter.getCounter()}',
          style: TextStyle(
              fontSize: 30
          ),
          ),
        ),
      ),
    );
  }
}