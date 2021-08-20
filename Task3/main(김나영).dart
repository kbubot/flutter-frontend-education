import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  List<Map<String, dynamic>> bookstore = [
    {
      'book_name': '책 제목 : 딥러닝 개념과 활용',
      'writer': '작가 : 김의중',
      'return_date': "20210821",
      'borrow_date': '20210810',
      'picture': 'Image/book0.png',
    },
    {
      'book_name': '책 제목 : 가면산장 살인사건',
      'writer': '작가 : 히가시노 게이고',
      'return_date': "20210827",
      'borrow_date': '20210813',
      'picture': 'Image/book2.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Task',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),


        body: ListView.builder(
            itemBuilder: (context, index){
          final today = DateTime.now();
          final returnday = DateTime.parse(bookstore[index % 2]['return_date']);
          final D_Day = returnday.difference(today).inDays+1 ;

          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "${bookstore[index%2]["picture"]}",width: 120,
                    ),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child:Container(height:30,
                                child:Text('${bookstore[index%2]["book_name"]}',
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child:Container(
                              height:20,
                              child:Text('D-$D_Day',
                                style: TextStyle(
                                    color: Colors.white),),color: Colors.cyan,),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child:Container(height:50,
                          child: Text(
                            '${bookstore[index%2]["writer"]}',
                          ),),
                      ),
                      Container(
                        child: Text('대출일-반납일 : '
                            '${bookstore[index%2]["borrow_date"]}-${bookstore[index%2]["return_date"]}'
                          ,),)
                    ],
                   )
                  ],
                ),
              ],
            ),
           );
         }
       ),
    );
  }
}