import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
        home: ChangeNotifierProvider(
      create: (BuildContext context) => Counter(),
      child: ProviderPage(),
    )));

class Counter extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  remove() {
    _count--;
    notifyListeners();
  }

  add() {
    _count++;
    notifyListeners();
  }
}

class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  PageController controller = PageController(
    initialPage: 0,
  );
  late Counter counter;

  @override
  Widget build(BuildContext context) {
    counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Flutter Tutorial',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        )),
        backgroundColor: Colors.white10,
        elevation: 0.0,
      ),
      body: PageView(controller: controller, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                Provider.of<Counter>(context).count.toString(),
                style: TextStyle(fontSize: 45),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                  minWidth: 100,
                  height: 40,
                  child: RaisedButton(
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      color: Colors.red,
                      onPressed: () {
                        counter.remove();
                      }),
                ),
                SizedBox(
                  width: 30,
                ),
                ButtonTheme(
                  minWidth: 100,
                  height: 40,
                  child: RaisedButton(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        counter.add();
                      }),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            ButtonTheme(
              minWidth: 230,
              height: 60,
              child: RaisedButton(
                  color: Colors.amber,
                  child: Text(
                    '페이지 이동',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      controller.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                    });
                  }),
            ),
          ],
        ),
        Center(
          child: Text(
            'Num : ${Provider.of<Counter>(context).count.toString()}',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ]),
    );
  }
}
