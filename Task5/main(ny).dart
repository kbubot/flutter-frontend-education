import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    title: 'Fifthly flutter App',
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          title: Text(' ')),
      body: Login(),
    ),
  ));
}

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
            Container(
              child: Text('로그인',
                style: TextStyle(
                    color:Colors.black,
                    fontWeight: FontWeight.bold,fontSize: 40),
              ),
            ),
          Container(
            padding: EdgeInsets.only(bottom: 40),
            child: Text('로그하신 후 모든 서비스를 이용하실 수 있습니다.',
              style: TextStyle(color: Colors.grey,fontSize: 15),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '아이디입력',
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '비밀번호입력',
            ),
            ),
          Container(
            child: RaisedButton(
              child: Text('로그인',
                  style: TextStyle(color: Colors.grey,fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>Dice()),
                  );
                }
            ),
            padding: EdgeInsets.only(top: 12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTheme(
                minWidth: 20,
                height: 30,
                child: RaisedButton(
                  child: Text('회원가입'),
                  textColor: Colors.grey,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>JoinPage()),
                    );
                  }
                ),
              ),
              ButtonTheme(
                minWidth: 20,
                height: 30,
                child: RaisedButton(
                    child: Text('비밀번호 찾기'),
                    textColor: Colors.grey,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>Login()),
                      );
                    }
                ),
              )
            ],
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}


class JoinPage extends StatefulWidget {
  @override
  JoinPageState createState() => JoinPageState();
}

class JoinPageState extends State<JoinPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 120, 10),
                  child: Text(
                    '아이디로 회원가입',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 33),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 120, 20),
                  child: Text(
                    '로그인은 최고 5자 이상으로 입력해주세요',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '아이디 입력',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '비밀번호 입력',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '비밀번호 확인',
                ),
              ),
              ButtonTheme(
                minWidth: 350,
                height: 50,
                child: RaisedButton(
                    child: Text('다음으로'),
                    textColor: Colors.white,
                    color: Colors.yellow,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>Name()),
                      );
                    }
                ),
              ),
            ],
          ),
      ),
    );
  }
}



class Name extends StatefulWidget {
  @override
  NameState createState() => NameState();
}

class NameState extends State<Name> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
          body: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 190, 0),
                  child: Text(
                    '닉네임 입력',
                    style: TextStyle(fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '닉네임 입력',
                ),
              ),
              ButtonTheme(
                minWidth: 350,
                height: 50,
                child: RaisedButton(
                    child: Text('입력'),
                    textColor: Colors.white,
                    color: Colors.yellow,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>Login()),
                      );
                    }
                ),
              ),
            ],
          ),
    );
  }
}


class Dice extends StatefulWidget {
  @override
  DiceState createState() => DiceState();
}

class DiceState extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBody() {
    return Center(
        child: ButtonTheme(
          minWidth: 100.0,
          height: 60.0,
          child: RaisedButton(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50.0,
              ),
              color: Colors.orangeAccent,
              onPressed: () {
                showToast('가입완료');
              }),
        ));
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: '회원가입이 완료되었습니다!!',
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
