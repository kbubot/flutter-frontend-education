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

  String _history = 'history';

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
            _history += ' +';
            break;
          case calcoperator.dif:
            _history += ' -';
            break;
          case calcoperator.mul:
            _history += ' x';
            break;
          case calcoperator.div:
            _history += ' /';
            break;
        }
      }else{
      }
      _op = iop;
      _numstore = _numinput;
      //_numinput = 0;
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
        _history += ' ' + _numinput.toString();
      }
      _op = calcoperator.opnull;
      _opin_yn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_numinput'),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child:Text('7'),
                    onPressed: () => _numberinput(7),
                  ),
                  RaisedButton(
                    child:Text('8'),
                    onPressed:() => _numberinput(8),
                  ),
                  RaisedButton(
                    child:Text('9'),
                    onPressed: () => _numberinput(9),
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child:Text('4'),
                    onPressed: () => _numberinput(4),
                  ),
                  RaisedButton(
                    child:Text('5'),
                    onPressed: () => _numberinput(5),
                  ),
                  RaisedButton(
                    child:Text('6'),
                    onPressed: () => _numberinput(6),
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child:Text('1'),
                    onPressed: () => _numberinput(1),
                  ),
                  RaisedButton(
                    child:Text('2'),
                    onPressed: () => _numberinput(2),
                  ),
                  RaisedButton(
                    child:Text('3'),
                    onPressed: () => _numberinput(3),
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                  child:Text('0'),
                  onPressed: () => _numberinput(0),
                      ),
                  RaisedButton(
                  child:Text('='),
                  onPressed: _getresult,
                      ),
                      ]
                      ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      child:Text('C'),
                      onPressed: (){//Clear
                        setState(() {
                          _numinput = 0;
                          _numstore = 0;
                          _op = calcoperator.opnull;
                          _opin_yn = false;
                          _history = '';
                        });
                      }
                  ),
                  RaisedButton(
                    child:Text('+'),
                    onPressed: () => _opinput(calcoperator.add),
                  ),
                  RaisedButton(
                    child:Text('-'),
                    onPressed: () => _opinput(calcoperator.dif),
                  ),
                  RaisedButton(
                    child:Text('*'),
                    onPressed: () => _opinput(calcoperator.mul),
                  ),
                  RaisedButton(
                    child:Text('/'),
                    onPressed: () => _opinput(calcoperator.div),
                  ),
                ]
            ),
            Text(_history),
          ],
        )
    );
  }
}