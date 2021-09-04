import 'package:flutter/material.dart';
import 'package:log_in/second.dart';
import 'package:log_in/signinpage.dart';
import 'name.dart';

bool a = false;
bool b = false;
bool x = false;
bool y = false;
bool z = false;

String? text1;
String? text2;

TextEditingController controller = TextEditingController();
TextEditingController controller2 = TextEditingController();

TextEditingController controller3 = TextEditingController();
TextEditingController controller4 = TextEditingController();
TextEditingController controller5 = TextEditingController();

TextEditingController controller6 = TextEditingController();

void main() => runApp(MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    ));

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '로그인하신 후 모든 서비스를 이용하실수 있습니다',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              Form(
                  child: Theme(
                      data: ThemeData(
                          primarySwatch: Colors.amber,
                          inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: Colors.grey, fontSize: 15.0))),
                      child: Container(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                labelText: '아이디 입력',
                                suffixIcon: IconButton(
                                  onPressed: () => controller.clear(),
                                  color: Colors.grey,
                                  icon: Icon(Icons.cancel),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              keyboardType: TextInputType.text,
                              onChanged: (text) {
                                setState(() {
                                  if (text.length >= 5) {
                                    a = true;
                                  } else {
                                    a = false;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: controller2,
                              decoration: InputDecoration(
                                  labelText: '비밀번호 입력',
                                  suffixIcon: IconButton(
                                    onPressed: () => controller2.clear(),
                                    color: Colors.grey,
                                    icon: Icon(Icons.cancel),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4))),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              onChanged: (text) {
                                setState(() {
                                  if (text.length >= 5) {
                                    b = true;
                                  } else {
                                    b = false;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ButtonTheme(
                                minWidth: 100,
                                height: 50,
                                child: FlatButton(
                                  color: a && b ? Colors.amber : Colors.white10,
                                  onPressed: () {
                                    if (controller.text == text1 &&
                                        controller2.text == text2) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  SecondPage()));
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '로그인',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: a && b
                                              ? Colors.white
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonTheme(
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  SignInPage()));
                                    },
                                    child: Text(
                                      '회원가입',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '|',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '비밀번호 찾기',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
