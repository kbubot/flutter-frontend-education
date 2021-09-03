import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final idTextEditControllor = TextEditingController(); //TextEditingController 만들기
final passwordTextEditControllor = TextEditingController();
final passwordcheck = TextEditingController();
final idTextEditControllor2 = TextEditingController();
final passwordTextEditControllor2 = TextEditingController();

late String id; //아이디를 담을 변수
late String password; //비밀번호를 담을 변수

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '과제',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final formKey = new GlobalKey<FormState>(); //폼키 써주기

  bool condition2() {
    return (idTextEditControllor.text == idTextEditControllor2.text &&
        passwordTextEditControllor.text == passwordTextEditControllor2.text && idTextEditControllor2.text.length>=1 );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: Container(
                    child: Text(
                      '로그인',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    '로그인 하신 후 모든 서비스를 이용하실 수 있습니다',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: '아이디 입력'),
                    controller: idTextEditControllor2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: '비밀번호 입력'),
                    controller: passwordTextEditControllor2,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonTheme(
                  minWidth: 350,
                  height: 50,
                  child: FlatButton(child: Text('로그인'),
                      color: condition2()? Colors.yellow : null ,
                      onPressed: () {
                      condition2()?
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => joinJoin())):null;
                  }),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonTheme(
                      minWidth: 110,
                      height: 50,
                      child: FlatButton(
                          child: Text('회원가입'),
                          onPressed: () {
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JoinPage()));
                            }
                          }),
                    ),
                    Container(
                      height: 14,
                      width: 0.5,
                      color: Colors.black,
                    ),
                    ButtonTheme(
                      minWidth: 110,
                      height: 50,
                      child:
                      FlatButton(child: Text('비밀번호 찾기'), onPressed: () {}),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JoinPage extends StatefulWidget {
  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final formKey = new GlobalKey<FormState>(); //폼키 써주기

  bool condition() {
    return (idTextEditControllor.text.length >= 5 &&
        passwordTextEditControllor.text == passwordcheck.text && passwordTextEditControllor.text.length >= 1);
  }

  @override
  void dispose() {
    idTextEditControllor.dispose();
    passwordTextEditControllor.dispose();
    passwordcheck.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 150, 0),
                  child: Text(
                    '아이디로 회원가입',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 150, 0),
                  child: Text(
                    '로그인은 최고 5자 이상으로 입력해주세요',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFormField(
                  controller: idTextEditControllor,
                  onSaved: (val) {
                    setState(() {
                      id = val!;
                    });
                  },
                  validator: (val) {
                    return null;
                  },
                  decoration: InputDecoration(labelText: '아이디 입력'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFormField(
                  controller: passwordTextEditControllor,
                  onSaved: (val) {
                    setState(() {
                      password = val!;
                    });
                  },
                  validator: (val) {
                    return null;
                  },
                  decoration: InputDecoration(labelText: '비밀번호 입력'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFormField(
                  controller: passwordcheck,
                  onSaved: (val) {
                    setState(() {
                      password = val!;
                    });
                  },
                  validator: (val) {
                    return null;
                  },
                  decoration: InputDecoration(labelText: '비밀번호 확인'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 350,
                height: 50,
                child: FlatButton(
                    child: Text('다음으로'),
                    color: condition()?Colors.yellow:null,
                    onPressed: () {
                      {
                        condition()
                            ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NickName()))
                            : null;
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NickName extends StatefulWidget {
  @override
  _NickNameState createState() => _NickNameState();
}

class _NickNameState extends State<NickName> {
  final formKey = new GlobalKey<FormState>();
  final nicknameControllor = TextEditingController();

  bool nicknamecheck() {
    return (nicknameControllor.text.length >= 1);
  }

  late String nickname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 190, 0),
                  child: Text(
                    '닉네임 입력',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFormField(
                  controller: nicknameControllor,
                  onSaved: (val) {
                    setState(() {
                      this.nickname = val!;
                    });
                  },
                  validator: (val) {
                    return null;
                  },
                  decoration: InputDecoration(labelText: '닉네임 입력'),
                ),
              ),
              SizedBox(height: 10),
              ButtonTheme(
                minWidth: 350,
                height: 50,
                child: FlatButton(
                    child: Text('입력'),
                    color: nicknamecheck()?Colors.yellow:null,
                    onPressed: () {
                      nicknamecheck()?showToast():null;
                      nicknamecheck()?
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstPage())):null;
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showToast(){
  Fluttertoast.showToast(
    msg: '회원가입이 완료되었습니다',
    backgroundColor: Colors.black,
    gravity: ToastGravity.CENTER,
    fontSize: 13,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}

class joinJoin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0.0,),
      body: Center(
        child: Container(
          child: Text('가입완료',style: TextStyle(fontSize: 40),),
        ),
      ),
    );
  }
}


