import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(home: BookScroll()));

class BookScroll extends StatefulWidget {
  @override
  _BookScrollState createState() => _BookScrollState();
}

class _BookScrollState extends State<BookScroll> {
  List<Map<String, dynamic>> booklist = [
    {
      'book_name': '책 제목 : 딥러닝 개념과 활용',
      'writer': '작가 : 김의중',
      'return_date': "20210821",
      'borrow_date': '20210810',
      'image': 'assets/book0.png'
    },
    {
      'book_name': '책 제목 : 가면산장 살인사건',
      'writer': '작가 : 히가시노 게이고',
      'return_date': "20210827",
      'borrow_date': '20210813',
      'image': 'assets/book2.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Task',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          final date = DateTime.now();
          final date2 = DateTime.parse(booklist[index % 2]['return_date']);
          final In_Day = date2.difference(date).inDays + 1;

          return Container(
            height: 170,
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 3)),
                      Image.asset(
                        '${booklist[index % 2]['image']}',
                        height: 160,
                        width: 120,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                "${booklist[index % 2]['book_name']}",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'STIXTwoText-Regular'),
                              ),
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 7))
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(5, 3, 5, 4),
                                    color: Colors.blue[200],
                                    child: Text(
                                      'D-$In_Day',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 30, 0, 0),
                          child: Text(
                            "${booklist[index % 2]["writer"]}",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 60, 0, 0),
                          child: Text(
                            "대출일 - 반납일 : ${booklist[index % 2]["borrow_date"]} - ${booklist[index % 2]["return_date"]}",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          );
        }));
  }
}
