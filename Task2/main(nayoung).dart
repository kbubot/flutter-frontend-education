import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum calcoperator {opnull, add, dif, mul, div}

void main() {
  runApp(MyApp());
}


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

  int _numinput = 0;
  int _numstore = 0;
  bool _opin_yn = false;
  calcoperator _op = calcoperator.opnull;

  void _numberinput(int inum){
    setState(() {
      if(_opin_yn){
        _numinput = 0;
      }
      _numinput = _numinput * 10 + inum;
      _opin_yn = false;
    });
  }

  void _opinput(calcoperator iop){
    setState((){
      if(!_opin_yn) {
        _getresult();
        switch(iop) {
          case calcoperator.add:
            break;
          case calcoperator.dif:
            break;
          case calcoperator.mul:
            break;
          case calcoperator.div:
            break;
        }
      }else{
      }
      _op = iop;
      _numstore = _numinput;
      _numinput = 0;
      _opin_yn = true;
    });
  }

  void _getresult(){
    setState(() {
      if(!_opin_yn) {
        switch (_op) {
          case calcoperator.add:
            _numinput = _numstore + _numinput;
            break;
          case calcoperator.dif:
            _numinput = _numstore - _numinput;
            break;
          case calcoperator.mul:
            _numinput = _numstore * _numinput;
            break;
          case calcoperator.div:
            _numinput = (_numstore / _numinput).toInt();
            break;
        }
      }
      _op = calcoperator.opnull;
      _opin_yn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
              'Second Task',
            style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
          centerTitle: true,
        ),
        body: Column(
            children:[
              Flexible(
                fit: FlexFit.tight,
                child: ListView(
                  children: [
                    Container(
                      child: Text('$_numstore',style: TextStyle(fontSize: 30),),
                      alignment: Alignment(1.0,1.0),
                    )
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  child: Text('$_numinput',style: TextStyle(fontSize: 60) ,),
                  alignment: Alignment(1.0,1.0),
                ),
              ),
              Flexible(
                flex: 4,
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Row(
                              children: [
                              ButtonTheme(
                              minWidth: 100.0,
                              height: 112.5,
                              child: RaisedButton(
                                child: Text('7'),
                                onPressed: ()=> _numberinput(7),
                                  textColor: Colors.black,
                                  color: Colors.white,
                              ),
                            ),
                                ButtonTheme(
                                  minWidth: 100.0,
                                  height: 112.5,
                                  child: RaisedButton(
                                    child: Text('8'),
                                    onPressed: ()=> _numberinput(8),
                                    textColor: Colors.black,
                                    color: Colors.white,
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 100.0,
                                  height: 112.5,
                                  child: RaisedButton(
                                    child: Text('9'),
                                    onPressed: ()=> _numberinput(9),
                                    textColor: Colors.black,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Row(
                              children: [
                                ButtonTheme(
                                  minWidth: 100.0,
                                  height: 112.5,
                                  child: RaisedButton(
                                    child: Text('4'),
                                    onPressed: ()=> _numberinput(4),
                                    textColor: Colors.black,
                                    color: Colors.white,
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 100.0,
                                  height: 112.5,
                                  child: RaisedButton(
                                    child: Text('5'),
                                    onPressed: ()=> _numberinput(5),
                                    textColor: Colors.black,
                                    color: Colors.white,
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 100.0,
                                  height: 112.5,
                                  child: RaisedButton(
                                    child: Text('6'),
                                    onPressed: ()=> _numberinput(6),
                                    textColor: Colors.black,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Row(
                              children: [
                                ButtonTheme(
                                  minWidth: 100.0,
                                  height: 112.5,
                                  child: RaisedButton(
                                    child: Text('1'),
                                    onPressed: ()=> _numberinput(1),
                                    textColor: Colors.black,
                                    color: Colors.white,
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 100.0,
                                  height: 112.5,
                                  child: RaisedButton(
                                    child: Text('2'),
                                    onPressed: ()=> _numberinput(2),
                                    textColor: Colors.black,
                                    color: Colors.white,
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 100.0,
                                  height: 112.5,
                                  child: RaisedButton(
                                    child: Text('3'),
                                    onPressed: ()=> _numberinput(3),
                                    textColor: Colors.black,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Row(
                              children: [
                                ButtonTheme(
                                  minWidth: 200.0,
                                  height: 112.5,
                                  child: RaisedButton(
                                    child: Text('0'),
                                    onPressed: ()=> _numberinput(0),
                                    textColor: Colors.black,
                                    color: Colors.white,
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 100.0,
                                  height: 112.5,
                                  child: RaisedButton(
                                    child: Text('='),
                                    onPressed: _getresult,
                                    textColor: Colors.black,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ButtonTheme(
                                    minWidth: 100.0,
                                    height: 90.0,
                                    child: RaisedButton(
                                      child: Text('C'),
                                        textColor: Colors.black,
                                        color: Colors.white,
                                        onPressed: (){
                                          setState(() {
                                            _numinput = 0;
                                            _numstore = 0;
                                            _op = calcoperator.opnull;
                                            _opin_yn = false;
                                          });
                                        }
                                    ),
                                  ),
                                  ButtonTheme(
                                    minWidth: 100.0,
                                    height: 90.0,
                                    child: RaisedButton(
                                      child: Text('+'),
                                      onPressed: () => _opinput(calcoperator.add),
                                      textColor: Colors.black,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ButtonTheme(
                                    minWidth: 100.0,
                                    height: 90.0,
                                    child: RaisedButton(
                                      child: Text('-'),
                                      onPressed: () => _opinput(calcoperator.dif),
                                      textColor: Colors.black,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ButtonTheme(
                                    minWidth: 100.0,
                                    height: 90.0,
                                    child: RaisedButton(
                                      child: Text('*'),
                                      onPressed: () => _opinput(calcoperator.mul),
                                      textColor: Colors.black,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ButtonTheme(
                                    minWidth: 100.0,
                                    height: 90.0,
                                    child: RaisedButton(
                                      child: Text('/'),
                                      onPressed: () => _opinput(calcoperator.div),
                                      textColor: Colors.black,
                                      color: Colors.white,
                                    ),
                                  ),
                                ]
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              )
            ]
        )
    );
  }

}