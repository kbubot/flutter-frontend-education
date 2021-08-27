import 'package:flutter/material.dart';
import 'http.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    ));

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          for (int i = 1; i <= 3; i++)
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Introduction Screen',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '$i 번째 스크린',
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int k = 1; k <= 4; k++)
                        Container(
                          width: 22,
                          child: Icon(
                            Icons.circle,
                            color: (i == k) ? Colors.blue : Colors.grey,
                            size: 14,
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Introduction Screen',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('4 번째 스크린'),
                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondPage()));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
