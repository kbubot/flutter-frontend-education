import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '스크롤 되는 앱', //앱 이름
      home: MyHomePage(),
    );

  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<dynamic,dynamic>> book=[ //List안에 Map으로 만든 자료구조,왜 var로만 하면 안될까..
    {
      'picture': 'assets/book0.png',
      'book_name': '딥러닝 개념과 활용',
      'writer': '김의중',
      'return_date': "20210821",
      'borrow_date': '20210810'
    },
    {
      'picture':'assets/book2.png',
      'book_name': '가면산장 살인사건',
      'writer': '히가시노 게이고',
      'return_date': '20210827',
      'borrow_date': '20210813'
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Task',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black
          ),),centerTitle: true,elevation: 0.0,
      ),
      body:(ListView.builder(

          itemBuilder:(BuildContext, index){
          final nowdate=DateTime.now(); //왜 타입을 이걸로 하는걸까
          final returnday=DateTime.parse('${book[index%2]["return_date"]}');
          final difference=returnday.difference(nowdate).inDays;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset("${book[index%2]["picture"]}",width: 100,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child:Container(height:30,child:Text('책 제목 : ${book[index%2]["book_name"]}',


                                  textAlign: TextAlign.left)),

                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child:Container(
                                height:20,
                                child:Text('D-$difference',style: TextStyle(color: Colors.white),),color: Colors.cyan,),

                            ),
                          ],
                        ),
                        Container(height:50,child: Text('작가 : ${book[index%2]["writer"]}',),),
                        Container(child: Text('대출일-반납일 : ${book[index%2]["borrow_date"]}-${book[index%2]["return_date"]}',),)
                      ],
                    )
                  ],


                  ),



                ],


              ),
            );
          }



      )

      ) ,
    );
  }
}