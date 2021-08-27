import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:http/http.dart'as http;


  Future<List<Post>> fetchPost() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List list=jsonDecode(response.body);
      var postlist = list.map((element)=>Post.fromJson(element)).toList();
      return postlist;
    } else {
      throw Exception('Failed to load post');
    }
  }

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.userId,required this.id,required this.title,required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = ' ';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title:  Text(' Flutter Tutorial ',
            style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: const PageViewWidget(),
      ),
    );
  }
}

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0,);

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[
        Container(
          color: Colors.white.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Introduction Screen',
                style: TextStyle(fontSize: 30,
                    color: Colors.black,
                    fontWeight:FontWeight.bold),
              ),
              Text(
                '1 번째 스크린',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ),
              )
            ],
          )
        ),
        Container(
          color: Colors.white.withOpacity(0.5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children : [
                Text(
                  'Introduction Screen',
                  style: TextStyle(fontSize: 30,
                      color: Colors.black,
                      fontWeight:FontWeight.bold),
                ),
                Text(
                  '2 번째 스크린',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                )
              ]
          ),
        ),
        Container(
          color: Colors.white.withOpacity(0.5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children : [
                Text(
                  'Introduction Screen',
                  style: TextStyle(fontSize: 30,
                      color: Colors.black,
                      fontWeight:FontWeight.bold),
                ),
                Text(
                  '3 번째 스크린',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ]
          ),
        ),
        Container(
          color: Colors.white.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Introduction Screen',
                style: TextStyle(fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold),
              ),
              Text(
                '4 번째 스크린',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    minWidth: 20,
                    height: 30,
                    child: RaisedButton(
                      child: Text('Done'),
                      textColor: Colors.white,
                      color: Colors.lightBlueAccent,
                      onPressed: () {
                        Navigator.push(
                            context,
                        MaterialPageRoute(
                          builder: (context)=>ListContainer()),
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        )
    ],
    );
  }
}
class ListContainer extends StatefulWidget {
  @override
  ListContainerState createState() => ListContainerState();
}

class ListContainerState extends State<ListContainer> {
  late Future <List<Post>> postlist;

  @override
  void initState() {
    super.initState();
   postlist = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
              ' Flutter Tutorial ',
          style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<List<Post>>(
            future: postlist,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Post>? data = snapshot.data;
                return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context,index){
                    return Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding:EdgeInsets.fromLTRB(10, 10, 10, 5),
                                    child: Container(
                                      child: Text(
                                        'UserID:${data[index].userId}',
                                        style: TextStyle(
                                            fontSize: 30, fontWeight: FontWeight.bold),
                                      ),

                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding:EdgeInsets.fromLTRB(10, 5, 10, 10),
                            child: Container(
                              child: Text(
                                  'ID:${data[index].id}'
                              ),
                            ),
                          ),
                          Padding(
                            padding:EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Container(
                              child: Text(
                                data[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 15
                              ),),
                            ),
                          ),
                          Padding(
                            padding:EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Container(
                              child: Text(
                                  data[index].body),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}